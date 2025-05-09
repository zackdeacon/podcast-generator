FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-full \
    python3-pip \
    git

RUN python3 -m venv /app

ENV PATH="/app/bin:$PATH"

RUN /app/bin/pip install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
