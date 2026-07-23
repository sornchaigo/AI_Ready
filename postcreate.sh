sudo chown -R ${UID}:${GID} ${HOME} /workspaces

uv venv --clear
uv sync
source /workspaces/.venv/bin/activate


uvicorn aiready.asgi:application --reload --port 8000