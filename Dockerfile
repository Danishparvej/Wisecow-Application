FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    wget \
    fortune \
    cowsay \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x wisecow.sh
CMD ["./wisecow.sh"]
