FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*
COPY wisecow.sh /usr/src/app/wisecow.sh
WORKDIR /usr/src/app
RUN chmod +x wisecow.sh
CMD ["./wisecow.sh"]
