#!/bin/bash

sudo rm -Rf practica_big_data_2019
sudo rm -Rf ~/airflow

/usr/local/kafka/bin/kafka-topics.sh \
      --bootstrap-server localhost:9092 \
      --delete \
      --topic flight_delay_classification_request

/usr/local/kafka/bin/zookeeper-server-stop.sh
/usr/local/kafka/bin/kafka-server-stop.sh
service mongod stop

echo "Scenario destroyed successfully!"
