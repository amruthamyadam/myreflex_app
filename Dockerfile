
FROM python:3.11-slim

WORKDIR /app

# Install Node.js & npm (required for Reflex frontend build)
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt-get/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Initialize and export production frontend assets
RUN reflex init
RUN reflex export --frontend-only --no-zip

# Expose backend/frontend ports
EXPOSE 3000 8000

# Run Reflex in production mode
CMD ["reflex", "run", "--env", "prod"]