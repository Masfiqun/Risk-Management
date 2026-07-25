from fastapi import APIRouter

router = APIRouter()


@router.get("/zones")
def get_zones():
    return [
        {
            "id": "1",
            "name": "Server Room",
            "status": "critical",
            "temperature": 52,
            "humidity": 38,
            "gasLevel": 650,
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
            "humidity": 58,
            "gasLevel": 90,
            "fireDetected": False
        }
    ]