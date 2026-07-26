from sqlalchemy import (
    Column,
    Integer,
    Float,
    Boolean,
    DateTime,
    ForeignKey,
)
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship

from app.database.base import Base


class SensorData(Base):
    __tablename__ = "sensor_data"

    id = Column(Integer, primary_key=True, index=True)

    zone_id = Column(
        Integer,
        ForeignKey("zones.id"),
        nullable=False,
    )

    temperature = Column(Float, nullable=False)
    humidity = Column(Float, nullable=False)
    gas_level = Column(Float, nullable=False)
    fire_detected = Column(Boolean, default=False)

    created_at = Column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    zone = relationship(
        "Zone",
        back_populates="sensor_data",
    )