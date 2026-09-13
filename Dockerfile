FROM python:3.11-slim

WORKDIR /app

# Install Node.js & system dependencies required by Reflex
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project code into container
COPY . .

# Expose ports for frontend and backend API
EXPOSE 3000 8000

# Start Reflex in production mode
CMD ["reflex", "run", "--env", "prod"]