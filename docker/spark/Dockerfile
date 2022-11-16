FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Madrid

WORKDIR /home/

RUN apt update && apt-get -y install scala && \
	apt install curl mlocate default-jdk -y && \
	apt -y install wget && \
	apt update && apt -y full-upgrade && \
	wget https://archive.apache.org/dist/spark/spark-3.1.2/spark-3.1.2-bin-hadoop2.7.tgz && \
	tar xvf spark-3.1.2-bin-hadoop2.7.tgz && \
	mv spark-3.1.2-bin-hadoop2.7/ /opt/spark

RUN apt-get update && apt-get install -y gnupg2 && \
	echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && \
	echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && \
	curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && \
	apt-get update && \
	apt-get install -y sbt && \
	sbt --version

RUN apt install -y python3 && apt install -y python3-pip

RUN apt update && apt install -y git && \
        git clone https://github.com/ging/practica_big_data_2019.git && \
	chmod 777 practica_big_data_2019 && \
        practica_big_data_2019/resources/download_data.sh && \
	pip install -r practica_big_data_2019/requirements.txt 

ENV JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
ENV SPARK_HOME=/opt/spark

RUN cd practica_big_data_2019 && python3 resources/train_spark_mllib_model.py .

RUN sed -i 's@val base_path= "/Users/admin/IdeaProjects/ging/practica_big_data_2019"@val base_path= "/home/practica_big_data_2019"@g' /home/practica_big_data_2019/flight_prediction/src/main/scala/es/upm/dit/ging/predictor/MakePrediction.scala

RUN cd /home/practica_big_data_2019/flight_prediction && \
	sbt package && \
	chmod 777 target/scala-2.12/flight_prediction_2.12-0.1.jar 

EXPOSE 7077
EXPOSE 8581
EXPOSE 8582

