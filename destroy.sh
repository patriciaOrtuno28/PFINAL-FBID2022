#!/bin/bash

rm -Rf practica_big_data_2019

/usr/local/kafka/bin/zookeeper-server-stop.sh
/usr/local/kafka/bin/kafka-server-stop.sh
service mongod stop

echo "Scenario destroyed successfully!"
