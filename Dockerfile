FROM python:3.11

RUN apt-get update && \
    apt-get install -y git

WORKDIR /app

COPY . .
COPY models /app/models
COPY models/config.json /app/models/config.json
COPY models/gpt_bigcode-santacoder-ggml-q4_1.bin /app/models/gpt_bigcode-santacoder-ggml-q4_1.bin

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    python3-dev \
    python3-setuptools \
    gcc \
    make \
    wget

COPY requirements.txt .
WORKDIR /app



RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Check if the directory exists
RUN if [ ! -d models ]; then \
        mkdir -p /app/models && \
        wget -O /app/models/gpt_bigcode-santacoder-ggml-q4_1.bin https://huggingface.co/prashrex/Santacoder-gguf/blob/main/gpt_bigcode-santacoder-ggml-q4_1.bin; \
        wget -O /app/models/config.json https://huggingface.co/prashrex/Santacoder-gguf/blob/main/config.json; \
    fi


# Set environment variables
ENV PYTHONUNBUFFERED=1

CMD ["python3","-u","inference.py"]