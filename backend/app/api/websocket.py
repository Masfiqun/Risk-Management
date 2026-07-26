from fastapi import APIRouter, WebSocket, WebSocketDisconnect

from app.websocket.manager import manager

router = APIRouter()


@router.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await manager.connect(websocket)

    try:
        while True:
            # Wait for a message from the client
            data = await websocket.receive_text()

            print(f"Received: {data}")

            # Echo it back
            await manager.send_personal_message(
                f"Server received: {data}",
                websocket,
            )

    except WebSocketDisconnect:
        manager.disconnect(websocket)