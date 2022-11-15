FROM ubuntu:22.04

RUN apt update && \
	apt install curl mlocate default-jdk -y && \
	apt -y install wget && \
	wget https://archive.apache.org/dist/kafka/3.0.0/kafka_2.12-3.0.0.tgz && \
	tar xzf kafka_2.12-3.0.0.tgz && \
	mv kafka_2.12-3.0.0 /usr/local/kafka && \
	useradd zookeeper -m && \
	usermod --shell /bin/bash zookeeper && usermod --shell /bin/bash zookeeper && \
	mkdir -p /data/zookeeper && \
	chown -R zookeeper:zookeeper /data/zookeeper && \
	cd /opt && \
	wget https://downloads.apache.org/zookeeper/zookeeper-3.6.3/apache-zookeeper-3.6.3-bin.tar.gz && \
	tar -xvf apache-zookeeper-3.6.3-bin.tar.gz && \
	mv apache-zookeeper-3.6.3-bin zookeeper && \
	chown -R zookeeper:zookeeper /opt/zookeeper && \
	cat > /opt/zookeeper/conf/zoo.cfg && \
	printf "tickTime = 2000\ndataDir = /data/zookeeper\nclientPort = 2181\ninitLimit = 5\nsyncLimit = 2" > /opt/zookeeper/conf/zoo.cfg

COPY kafka.sh /
RUN chmod 777 /kafka.sh

ENTRYPOINT ["/kafka.sh"]

EXPOSE 2181/tcp

