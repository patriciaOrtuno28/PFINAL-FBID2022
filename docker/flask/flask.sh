#!/bin/bash

cd practica_big_data_2019/resources/web

echo "http://localhost:5000/flights/delays/predict_kafka"

pip install joblib

python3 predict_flask.py
