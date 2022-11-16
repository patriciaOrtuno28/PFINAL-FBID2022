#!/bin/bash

cd practica_big_data_2019/resources/airflow

sed -i 's/numpy==1.20.3/numpy==1.21.5/g' constraints.txt

pip install -r requirements.txt -c constraints.txt

# Create folders
export AIRFLOW_HOME=~/airflow
cd /home/airflow
mkdir dags
mkdir logs
mkdir plugins

# Move the dag to the dags' folder
cp ../practica_big_data_2019/resources/airflow/setup.py dags/

# Create an airflow user
airflow users create \
    --username admin \
    --firstname Jack \
    --lastname  Sparrow\
    --role Admin \
    --email example@mail.org

# Launch airflow commands 
airflow db init

airflow webserver --port 8080 &

airflow scheduler &

# Inform the user of the URL to be visited 
echo "Visit http://localhost:5000/flights/delays/predict_kafka to make use of the flight delay predictions."
