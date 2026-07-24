# pull official base image
FROM python:3.14-alpine

# set work directory
WORKDIR /workspaces

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never \
    UV_PROJECT_ENVIRONMENT=/workspaces/.venv

# install system dependencies
# RUN apt-get update && apt-get install -y --no-install-recommends netcat-traditional

# install uv
COPY --from=ghcr.io/astral-sh/uv:0.8.14 /uv /uvx /bin/

# Since there's no point in shipping lock files, we move them
# into a directory that is NOT copied into the runtime image.
# The trailing slash makes COPY create `/_lock/` automagically.
COPY pyproject.toml uv.lock /_lock/

# Synchronize dependencies.
# This layer is cached until uv.lock or pyproject.toml change.
RUN --mount=type=cache,target=/root/.cache \
    cd /_lock && \
    uv sync \
    --frozen \
    --no-install-project

# copy entrypoint.sh
# COPY ./entrypoint.sh .
# RUN sed -i "s/\r$//g" /app/entrypoint.sh
# RUN chmod +x /app/entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
# ENTRYPOINT ["/workspaces/entrypoint.sh"]

RUN uv venv --clear
RUN uv sync
RUN source /workspaces/.venv/bin/activate

RUN uv run manage.py collectstatic
RUN uv run manage.py migrate --no-input
