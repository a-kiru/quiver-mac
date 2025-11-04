FROM node:18-bullseye

RUN apt-get update && \
    apt-get install -y python3 curl unzip imagemagick --fix-missing && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN make

EXPOSE 8000

CMD ["make", "serve"]