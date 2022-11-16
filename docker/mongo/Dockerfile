FROM mongo:latest

WORKDIR /home/

RUN apt update && apt install -y python3 && apt install -y python3-pip

RUN apt update && apt install -y curl && apt install -y git && \
        git clone https://github.com/ging/practica_big_data_2019.git && \
	chmod 777 practica_big_data_2019 && \
        practica_big_data_2019/resources/download_data.sh && \
	pip install -r practica_big_data_2019/requirements.txt 

RUN sed -i 's@mongo @mongosh @g' practica_big_data_2019/resources/import_distances.sh

RUN cd practica_big_data_2019 && ./resources/import_distances.sh 

EXPOSE 27017
