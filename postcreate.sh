sudo chown -R ${UID}:${GID} ${HOME} /workspaces

uv venv --prompt .venv 
uv sync


uvicorn aiready.asgi:application --reload --port 8000