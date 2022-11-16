FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Madrid

WORKDIR /home/

RUN apt update && \
apt install -y python3 && \
apt install -y python3-pip && \
dpkg --configure -a

COPY flask.sh /
RUN chmod 777 /flask.sh

ENTRYPOINT ["/flask.sh"]

EXPOSE 5000


