FROM python:3.10.8-slim-buster

WORKDIR /VJ-FILTER-BOT

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel setuptools_scm \
    && pip install -r requirements.txt

COPY . .

CMD ["python", "bot.py"]
