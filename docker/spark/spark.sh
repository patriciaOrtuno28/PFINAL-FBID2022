#!/bin/bash

# Import airline data using monsh
echo "Importing airline data ..."
sed -i 's@mongoimport @mongoimport --host mongo --port 27017 @g' practica_big_data_2019/resources/import_distances.sh
sed -i 's/mongo agile_data_science/mongosh mongo:27017/agile_data_science/g' practica_big_data_2019/resources/import_distances.sh
cd practica_big_data_2019
./resources/import_distances.sh

# Train the model
echo "Training the model ..."
python3 resources/train_spark_mllib_model.py .

# Modify the base_path
echo "Creating JAR file ..."
sed -i 's@val base_path= "/Users/admin/IdeaProjects/ging/practica_big_data_2019"@val base_path= "/home/practica_big_data_2019"@g' \
        /home/practica_big_data_2019/flight_prediction/src/main/scala/es/upm/dit/ging/predictor/MakePrediction.scala

# Create JAR file to use with spark-submit command
cd /home/practica_big_data_2019/flight_prediction
sbt package
chmod 777 target/scala-2.12/flight_prediction_2.12-0.1.jar

