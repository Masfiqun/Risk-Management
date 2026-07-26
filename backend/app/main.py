from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api import zones
from app.api import sensor_data
from app.api import websocket

app = FastAPI(title="SentinelAI API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(zones.router)
app.include_router(sensor_data.router)
app.include_router(websocket.router)