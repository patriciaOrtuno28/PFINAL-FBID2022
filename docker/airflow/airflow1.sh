#!/bin/bash

cd practica_big_data_2019
cd resources/airflow

sed -i 's/numpy==1.20.3/numpy==1.21.5/g' constraints.txt

pip install -r requirements.txt -c constraints.txt

export AIRFLOW_HOME=~/airflow
mkdir $AIRFLOW_HOME/dags
mkdir $AIRFLOW_HOME/logs
mkdir $AIRFLOW_HOME/plugins

cp setup.py ~/airflow/dags/

airflow users create \
    --username admin \
    --firstname Jack \
    --lastname  Sparrow\
    --role Admin \
    --email example@mail.org

airflow db init

cd 
airflow webserver --port 8080

# Finished deployment
cd PFINAL-FBID2022
echo "Scenario successfully deployed! Visit http://localhost:5000/flights/delays/predict_kafka to make use of the flight delay predictions."
