from sqlalchemy import Column, Integer, String, Float, Boolean
from sqlalchemy.orm import relationship

from app.database.base import Base


class Zone(Base):
    __tablename__ = "zones"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    status = Column(String)

    # Keep these for now
    temperature = Column(Float)
    humidity = Column(Float)
    gas_level = Column(Float)
    fire_detected = Column(Boolean)

    # One Zone -> Many SensorData
    sensor_data = relationship(
        "SensorData",
        back_populates="zone",
        cascade="all, delete-orphan",
    )