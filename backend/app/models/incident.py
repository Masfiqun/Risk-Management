from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.sql import func
from app.database.base import Base


class Incident(Base):
    __tablename__ = "incidents"

    id = Column(Integer, primary_key=True)

    title = Column(String)

    description = Column(String)

    severity = Column(String)

    created_at = Column(
        DateTime(timezone=True),
        server_default=func.now()
    )