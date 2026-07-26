from fastapi import APIRouter

router = APIRouter()


@router.get("/zones")
def get_zones():
    return [
        {
            "id": "1",
            "name": "API Checking Zone",
            "status": "critical",
            "temperature": 52,
            "humidity": 38,
            "gasLevel": 700,
            "fireDetected": True
        },
        {
            "id": "2",
            "name": "IoT Lab",
            "status": "warning",
            "temperature": 40,
            "humidity": 46,
            "gasLevel": 280,
            "fireDetected": False
        },
        {
            "id": "3",
            "name": "Robotics Lab",
            "status": "safe",
            "temperature": 29,
            "humidity": 79,
            "gasLevel": 90,
            "fireDetected": False
        }
    ]