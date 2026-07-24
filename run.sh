# uvicorn app.main:app --reload --port 8080 
uv venv --clear
uv sync
source /workspaces/.venv/bin/activate

# uv run manage.py collectstatic
uv run manage.py migrate --no-input
# uvicorn aiready.asgi:application --reload --port 8000