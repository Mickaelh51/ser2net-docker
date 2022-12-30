# docker build -t mickaelh51/ser2net:4.3.3 .
# to run it: sudo docker run --rm -i -t --name ser2net --network swarm-homeassistant --device /dev/ttyACM2:/dev/ttyACM2 mickaelh51/ser2net:4.3.3 -v ./ser2net.yaml:/etc/ser2net.yaml



FROM debian:11-slim

LABEL org.opencontainers.image.authors="mickael@winlux.fr"
LABEL version="4.3.3"
LABEL description="ser2net by docker"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ser2net && \
    rm -rf /var/lib/apt/lists/*

CMD echo -n "Starting " && ser2net -v && ser2net -d -c /etc/ser2net.yaml
