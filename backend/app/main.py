from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.zones import router as zones_router

app = FastAPI(
    title="SentinelAI API",
    version="1.0.0",
)

# Development CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(zones_router)


@app.get("/")
def root():
    return {
        "message": "SentinelAI Backend Running"
    }