from sqlalchemy import Column, Integer, Float, String
from app.database.base import Base


class Prediction(Base):
    __tablename__ = "predictions"

    id = Column(Integer, primary_key=True)

    zone_name = Column(String)

    fire_probability = Column(Float)

    gas_probability = Column(Float)

    predicted_status = Column(String)