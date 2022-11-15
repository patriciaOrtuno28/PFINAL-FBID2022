#!/bin/bash

cd
/usr/local/kafka/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties &

sleep 5

/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties &

sleep 10

/usr/local/kafka/bin/kafka-topics.sh \
      --create \
      --bootstrap-server localhost:9092 \
      --replication-factor 1 \
      --partitions 1 \
      --topic flight_delay_classification_request
