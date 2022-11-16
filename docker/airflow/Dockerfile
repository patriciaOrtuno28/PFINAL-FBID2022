FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Madrid

WORKDIR /home/

RUN apt update && apt install -y python3 && \
	apt install -y python3-pip && \
	apt install -y curl

RUN apt update && apt install -y git && \
        git clone https://github.com/ging/practica_big_data_2019.git && \
	chmod 777 practica_big_data_2019 && \
        practica_big_data_2019/resources/download_data.sh && \
	pip install -r practica_big_data_2019/requirements.txt

COPY airflow.sh /
RUN chmod 777 /airflow.sh

ENTRYPOINT ["/airflow.sh"]

EXPOSE 8080
