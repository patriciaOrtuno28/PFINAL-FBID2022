#!/bin/bash

# Clone the repository
echo "Cloning the repository ..."
git clone https://github.com/ging/practica_big_data_2019.git
cd practica_big_data_2019

# Required installation for new gnome terminals
echo "Installing package for gnome terminals ..."
sudo apt install -y dbus-x11

# Install initial requirements
echo "Installing initial requirements ..."
resources/download_data.sh
pip install -r requirements.txt

# Start zookeeper and kafka
echo "Starting zookeeper ..."
gnome-terminal --tab --title="Zookeeper" \
        --command="bash -c 'cd; chmod 777 /usr/local/kafka/; /usr/local/kafka/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties; $SHELL'"
echo "Starting kafka ..."
gnome-terminal --tab --title="Kafka" \
        --command="bash -c 'cd; /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties; $SHELL'"

# Create a kafka topic
echo "Creating a new kafka topic ..."
/usr/local/kafka/bin/kafka-topics.sh \
      --create \
      --bootstrap-server localhost:9092 \
      --replication-factor 1 \
      --partitions 1 \
      --topic flight_delay_classification_request

# Start MongoDB
echo "Starting mongoDB ..."
service mongod start

# Import airline data using monsh
echo "Importing airline data ..."
sed -i 's/mongo /mongosh /g' resources/import_distances.sh
./resources/import_distances.sh

# Export environment variables
echo "Exporting environment variables ..."
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
export SPARK_HOME=/opt/spark

# Train the model
echo "Training the model ..."
python3 resources/train_spark_mllib_model.py .

# Modify the base_path
echo "Creating JAR file ..."
sed -i 's+val base_path= "/Users/admin/IdeaProjects/ging/practica_big_data_2019"+val base_path= "/home/patricia/practica_big_data_2019"+g' \
	/home/patricia/practica_big_data_2019/flight_prediction/src/main/scala/es/upm/dit/ging/predictor/MakePrediction.scala

# Create JAR file to use with spark-submit command
cd flight_prediction
sbt package
chmod 777 target/scala-2.12/flight_prediction_2.12-0.1.jar
cd

# Spark-submit
echo "Submitting JAR file to Spark ..."
gnome-terminal --tab --title="Spark Submit" \
	--command="bash -c 'cd; /opt/spark/bin/spark-submit --deploy-mode client --class es.upm.dit.ging.predictor.MakePrediction --master local[2] --packages org.mongodb.spark:mongo-spark-connector_2.12:3.0.1,org.apache.spark:spark-sql-kafka-0-10_2.12:3.0.0 /home/patricia/practica_big_data_2019/flight_prediction/target/scala-2.12/flight_prediction_2.12-0.1.jar; $SHELL'"

# Run the web service
echo "Running the web service ..."
export PROJECT_HOME=/home/patricia/practica_big_data_2019
gnome-terminal --tab --title="Web Service" \
	--command="bash -c 'cd /home/patricia/practica_big_data_2019/resources/web; pip install joblib; python3 predict_flask.py; $SHELL'"

# Show database information
echo "Showing database information ..."
gnome-terminal --tab --title="Database Info" \
	--command="bash -c 'cd /home/patricia/; mongosh agile_data_science showdb.js; $SHELL'"
