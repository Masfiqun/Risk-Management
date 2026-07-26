from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app.database.session import get_db
from app.schemas.zone import ZoneCreate, ZoneResponse
from app.services.zone_service import ZoneService

router = APIRouter()


@router.get(
    "/zones",
    response_model=list[ZoneResponse]
)
def get_zones(
    db: Session = Depends(get_db)
):
    return ZoneService.get_all(db)


@router.post(
    "/zones",
    response_model=ZoneResponse
)
def create_zone(
    zone: ZoneCreate,
    db: Session = Depends(get_db)
):
    return ZoneService.create(
        db,
        zone.name,
        zone.status,
    )