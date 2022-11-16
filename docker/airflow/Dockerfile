FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Madrid

WORKDIR /home/

RUN apt update && apt install -y python3 && \
apt install -y python3-pip

COPY airflow1.sh /
RUN chmod 777 /airflow1.sh

COPY airflow2.sh /
RUN chmod 777 /airflow2.sh



ENTRYPOINT ["/airflow1.sh"]
ENTRYPOINT ["/airflow2.sh"]


EXPOSE 8080
EXPOSE 8081
