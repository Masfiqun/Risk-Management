from pydantic import BaseModel, Field, ConfigDict


class ZoneCreate(BaseModel):
    name: str
    status: str


class ZoneResponse(BaseModel):
    id: int
    name: str
    status: str
    temperature: float
    humidity: float

    gasLevel: float = Field(alias="gas_level")
    fireDetected: bool = Field(alias="fire_detected")

    model_config = ConfigDict(
        from_attributes=True,
        populate_by_name=True,
    )