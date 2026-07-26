from datetime import datetime

from pydantic import BaseModel, ConfigDict, Field


class SensorDataCreate(BaseModel):
    zone_id: int
    temperature: float
    humidity: float
    gasLevel: float = Field(alias="gas_level")
    fireDetected: bool = Field(alias="fire_detected")

    model_config = ConfigDict(
        populate_by_name=True,
    )


class SensorDataResponse(BaseModel):
    id: int
    zone_id: int
    temperature: float
    humidity: float

    gasLevel: float = Field(alias="gas_level")
    fireDetected: bool = Field(alias="fire_detected")

    created_at: datetime

    model_config = ConfigDict(
        from_attributes=True,
        populate_by_name=True,
    )