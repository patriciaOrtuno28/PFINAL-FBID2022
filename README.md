~~~

     ___             ___         _  __            __                    __       
    / _ \_______ ___/ (_)_______(_)/_/ ___    ___/ /__   _  ____ _____ / /__  ___
   / ___/ __/ -_) _  / / __/ __/ / _ \/ _ \  / _  / -_) | |/ / // / -_) / _ \(_-<
  /_/  /_/  \__/\_,_/_/\__/\__/_/\___/_//_/  \_,_/\__/  |___/\_,_/\__/_/\___/___/
                                                                               

~~~
FBID - MUIRST

2022

Laura Fernández Galindo & Patricia Ortuño Otero

# Instrucciones

- [Crear VM](#crearvm)
- [Instalar dependencias](#dependencias)
- [Iniciar el escenario](#deploy)
- [Destruir el escenario (Opcional)](#destroy)

## Crear máquina virtual Ubuntu 22.04 Google Cloud <a name="crearvm"></a>

- Acceder a Google Cloud con sus credenciales
- Crear una nueva instancia:
  - Compute Engine -> Instancias de VM
  - Crear instancia
    - Zona: europe-southwest1-a
    - Disco de arranque:
      - Ubuntu 22.04 LTS (Arquitectura x86-64)
      - Tamaño 18GB
    - Firewall: permitir tráfico HTTP y HTTPS
- Clonar este proyecto dentro de la máquina creada o subir los archivos manualmente
```console
git clone https://github.com/patriciaOrtuno28/fbid.git
```

## Instalar las dependencias <a name="dependencias"></a>
### Tecnologías
- [Python3](https://es.wikipedia.org/wiki/Python)
- [Pip](https://es.wikipedia.org/wiki/Pip_(administrador_de_paquetes))
- [Sbt](https://en.wikipedia.org/wiki/Sbt_(software))
- [MongoDB](https://www.mongodb.com/)
- [Spark](https://spark.apache.org/)
- [Scala](https://www.scala-lang.org/)
- [Zookeeper](https://zookeeper.apache.org/)
- [Kafka](https://kafka.apache.org/)

### Instalación
Para la realización de esta práctica de predicción de vuelos, se requiere un escenario con las tecnologías mencionadas en el apartado anterior previamente instaladas. Para ello se proporciona un script automatizado que las instalará, con versiones acordes al escenario a ejecutar posteriormente.

Primero, se debe proporcionar permisos al archivo a ejecutar:
```console
chmod 777 VM.sh
```
Ahora podemos ejecutarlo:
```console
./VM.sh
```
Este proceso puede demorarse varios minutos ya que está instalando múltiples tecnologías.

Cuando haya terminado la instalación, verá el siguiente mensaje por la consola:
```
All dependencies have been successfully installed. Please proceed with the execution of the flight-delay predictor scenario.
```

## Iniciar el escenario <a name="deploy"></a>
Para inicializar el escenario de predicción de retrasos (o adelantos) de vuelos, se proporciona un fichero que automatiza todas las funciones mencionadas en [Práctica Big Data 2019](https://github.com/ging/practica_big_data_2019).

Primero, se debe proporcionar permisos al archivo a ejecutar:
```console
chmod 777 deploy.sh
```
Ahora podemos ejecutarlo:
```console
./deploy.sh
```

## Destruir el escenario (Opcional) <a name="destroy"></a>
En caso de desearse revertir el proceso de instalación del escenario de predicción de vuelos, se proporciona un fichero adicional que ejecuta dicha acción.

Primero, se debe proporcionar permisos al archivo a ejecutar:
```console
chmod 777 destroy.sh
```
Ahora podemos ejecutarlo:
```console
./destroy.sh
```
