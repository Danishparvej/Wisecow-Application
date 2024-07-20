FROM ubuntu:20.04
WORKDIR /script
COPY . /script
RUN chmod +x wisecow.sh
CMD ["./wisecow.sh"]
