# Multi-stage Dockerfile for FastAPI backend

FROM python:3.11-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# System deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies using pyproject.toml
COPY pyproject.toml .
RUN pip install --upgrade pip && pip install .

# Copy application code
COPY app ./app
COPY alembic ./alembic
COPY alembic.ini ./alembic.ini

# Expose port
EXPOSE 3001

# Default envs
ENV ENVIRONMENT=production \
    DEBUG=False

# Run
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "3001"]


