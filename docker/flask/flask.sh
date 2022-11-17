#!/bin/bash

cd practica_big_data_2019/resources/web

echo "http://x.x.x.x:5000/flights/delays/predict_kafka"

pip install joblib

sed -i 's@localhost:9092@kafka:9092@g' predict_flask.py

python3 predict_flask.py
