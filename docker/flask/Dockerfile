FROM ubuntu:22.04

WORKDIR /home/

RUN apt update && apt install -y curl && \
	apt install curl mlocate default-jdk -y && \
	apt install -y python3 && \
	apt install -y python3-pip && \
	dpkg --configure -a

RUN apt update && apt install -y git && \
        git clone https://github.com/ging/practica_big_data_2019.git && \
	chmod 777 practica_big_data_2019 && \
        practica_big_data_2019/resources/download_data.sh && \
	pip install -r practica_big_data_2019/requirements.txt

ENV PROJECT_HOME=/home/practica_big_data_2019
ENV JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64

COPY flask.sh /
RUN chmod 777 /flask.sh

ENTRYPOINT ["/flask.sh"]

EXPOSE 5000


