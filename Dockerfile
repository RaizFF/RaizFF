FROM python:3.10-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y \
    && apt install -y git curl \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip setuptools wheel \
    && pip install -r /requirements.txt
COPY . /app
CMD ["python3", "bot.py"]
