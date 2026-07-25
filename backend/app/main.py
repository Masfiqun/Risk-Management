from fastapi import FastAPI

from app.api.zones import router as zones_router

app = FastAPI(
    title="SentinelAI API",
    version="1.0.0"
)

app.include_router(zones_router)


@app.get("/")
def root():
    return {
        "message": "SentinelAI Backend Running"
    }