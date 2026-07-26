from sqlalchemy.orm import Session

from app.models.sensor_data import SensorData


class SensorDataService:

    @staticmethod
    def get_all(db: Session):
        return db.query(SensorData).all()

    @staticmethod
    def get_latest_by_zone(
        db: Session,
        zone_id: int,
    ):
        return (
            db.query(SensorData)
            .filter(SensorData.zone_id == zone_id)
            .order_by(SensorData.created_at.desc())
            .first()
        )

    @staticmethod
    def create(
        db: Session,
        zone_id: int,
        temperature: float,
        humidity: float,
        gas_level: float,
        fire_detected: bool,
    ):
        sensor = SensorData(
            zone_id=zone_id,
            temperature=temperature,
            humidity=humidity,
            gas_level=gas_level,
            fire_detected=fire_detected,
        )

        db.add(sensor)
        db.commit()
        db.refresh(sensor)

        return sensor