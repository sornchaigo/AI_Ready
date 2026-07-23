# uvicorn app.main:app --reload --port 8080 
uv venv --clear
uv sync
source /workspaces/.venv/bin/activate

uvicorn aiready.asgi:application --reload --port 8000