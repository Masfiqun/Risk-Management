from sqlalchemy import Column, Integer, String, Boolean
from app.database.base import Base


class Alert(Base):
    __tablename__ = "alerts"

    id = Column(Integer, primary_key=True)

    message = Column(String)

    level = Column(String)

    is_read = Column(Boolean, default=False)