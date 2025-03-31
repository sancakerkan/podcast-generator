FROM ubuntu:latest

# Update package lists and install required system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Upgrade pip to the latest version
RUN python3 -m pip install --upgrade pip

# Install PyYAML
RUN pip3 install PyYAML

# Copy the Python script and entrypoint script into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make sure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
