FROM python:3.11-slim

WORKDIR /app

# Install Node.js & system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files into the container
COPY . .

# Initialize Reflex non-interactively
RUN reflex init --blank

# Expose default ports
EXPOSE 3000 8000

# Run Reflex in production mode
CMD ["reflex", "run", "--env", "prod"]