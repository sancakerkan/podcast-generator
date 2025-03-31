FROM ubuntu:latest

# Update the system and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install Python dependencies
RUN pip3 install PyYAML

# Copy the feed.py and entrypoint.sh into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make sure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Define the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
