FROM python:3.12-slim-trixie

# 1. Instalar dependencias del sistema y limpiar caché de apt (Mejor práctica aplicada)
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 2. Instalar uv
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

# 3. Establecer WORKDIR desde el principio es más ordenado
WORKDIR /app

# 4. 🔥 EL TRUCO MAGISTRAL: Copiar SOLO los archivos de requerimientos primero
COPY pyproject.toml uv.lock ./

# 5. Instalar dependencias (Si el código de la app cambia, Docker recicla esta capa pesada)
ENV UV_NO_DEV=1
# Instala las dependencias sin instalar el proyecto en sí todavía
RUN uv sync --locked --no-install-project 

# 6. AHORA SÍ, copiar el resto de tu código (FastAPI, Clean Architecture, etc.)
COPY . /app

# 7. Sincronizar el proyecto local
RUN uv sync --locked

# 8. Comando de ejecución
CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]