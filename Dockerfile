FROM nvidia/cuda:11.7.0-runtime-ubuntu20.04
WORKDIR /app/

RUN \
  apt-get update && \
  apt-get install -y python3.10 python3-pip curl && \
  curl -sSL https://install.python-poetry.org | python3 -
RUN apt-get install uvicorn -y

ENV PATH "/root/.local/bin:$PATH"

COPY pyproject.toml .
COPY poetry.lock .

RUN poetry install

COPY . .

ENTRYPOINT ["sleep", "infinity"]
# ENTRYPOINT ["python3", "-m", "uvicorn", "main:app", "--reload", "--host=0.0.0.0", "--port=8000"]