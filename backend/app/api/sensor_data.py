from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app.database.session import get_db
from app.schemas.sensor_data import (
    SensorDataCreate,
    SensorDataResponse,
)
from app.services.sensor_data_service import SensorDataService
from app.websocket.manager import manager

router = APIRouter()


@router.get(
    "/sensor-data",
    response_model=list[SensorDataResponse],
)
def get_sensor_data(
    db: Session = Depends(get_db),
):
    return SensorDataService.get_all(db)


@router.post(
    "/sensor-data",
    response_model=SensorDataResponse,
)
async def create_sensor_data(
    sensor: SensorDataCreate,
    db: Session = Depends(get_db),
):
    saved_sensor = SensorDataService.create(
        db=db,
        zone_id=sensor.zone_id,
        temperature=sensor.temperature,
        humidity=sensor.humidity,
        gas_level=sensor.gasLevel,
        fire_detected=sensor.fireDetected,
    )

    await manager.broadcast(
        {
            "type": "sensor_update",
            "zone_id": saved_sensor.zone_id,
            "temperature": saved_sensor.temperature,
            "humidity": saved_sensor.humidity,
            "gas_level": saved_sensor.gas_level,
            "fire_detected": saved_sensor.fire_detected,
            "created_at": saved_sensor.created_at.isoformat(),
        }
    )

    return saved_sensor


@router.get(
    "/sensor-data/latest/{zone_id}",
    response_model=SensorDataResponse | None,
)
def get_latest_sensor_data(
    zone_id: int,
    db: Session = Depends(get_db),
):
    return SensorDataService.get_latest_by_zone(
        db,
        zone_id,
    )