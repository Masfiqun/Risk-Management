from sqlalchemy.orm import Session

from app.models.zone import Zone


class ZoneService:

    @staticmethod
    def get_all(db: Session):
        return db.query(Zone).all()

    @staticmethod
    def get_by_id(db: Session, zone_id: int):
        return db.query(Zone).filter(
            Zone.id == zone_id
        ).first()

    @staticmethod
    def create(db: Session, name: str, status: str):
        zone = Zone(
            name=name,
            status=status
        )

        db.add(zone)
        db.commit()
        db.refresh(zone)

        return zone