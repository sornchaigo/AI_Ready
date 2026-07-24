sudo chown -R ${UID}:${GID} ${HOME} /workspaces
source /workspaces/.venv/bin/activate

cd AI_Ready
uv venv --clear
uv sync

uvicorn aiready.asgi:application --reload --port 8000