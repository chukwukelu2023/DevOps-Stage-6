FROM python:3.11-slim

# Set working directory
WORKDIR /app
ENV PIP_ROOT_USER_ACTION=ignore
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*
# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy application code
COPY main.py .

CMD ["python" ,"main.py"]