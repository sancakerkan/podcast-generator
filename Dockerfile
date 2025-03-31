FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install Python dependencies
RUN pip3 install PyYAML

# Copy Python script and entrypoint shell script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Use the exec form of ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
