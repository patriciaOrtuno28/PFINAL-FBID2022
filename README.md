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

> Nota: Debe escoger una de las dos opciones de creación de una máquina virtual Ubuntu 22.04 para desplegar el escenario. Se proporcionan instrucciones para una instalación local en VirtualBox a partir de una imagen ISO, y para la creación de un Ubuntu Desktop a través de Google Cloud.

- [Crear VM Ubuntu en VirtualBox](#crearvmlocal)
- [Crear VM Ubuntu en Google Cloud (RECOMENDADO)](#crearvm)
- [Instalar dependencias](#dependencias)
- [Iniciar el escenario](#deploy)
- [Destruir el escenario (Opcional)](#destroy)

## Crear máquina virtual Ubuntu 22.04 VirtualBox <a name="crearvmlocal"></a>

A continuación, se proporcionan las instrucciones para crear una máquina virtual con Ubuntu 22.04 en VirtualBox, para el despliegue del escenario localmente.

1. Descargar [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Crear una nueva máquina, con las siguientes características:
     - Tipo: Linux
     - Versión: Ubuntu 22.04 LTS (Jammy Jellyfish) (64 bit)
     - Memoria base (*recomendado*): > 4096 MB
     - Procesadores (*recomendado*): > 2
     - Tamaño de disco (*recomendado*): > 20 GB
3. Para tener acceso a Internet: Configuración -> Red -> Adaptador1 -> Adaptador puente
4. Inicie la máquina
5. Le solicitará una imagen ISO para hacer la instalación. Descargar [Ubuntu 22.04 Desktop Image (64-bit AMD64)](https://releases.ubuntu.com/22.04/) de la web oficial.
6. Siga los pasos para realizar la instalación. Se recomienda escoger la instalación mínima por cuestiones de rendimiento y velocidad de la descarga.
7. Al terminar la descarga, reinicie la máquina virtual. Presione *Enter* cuando se le solicite.
8. Clonar este repositorio dentro de la máquina creada:
     ```console
     git clone https://github.com/patriciaOrtuno28/PFINAL-FBID2022.git
     ```

> Nota: Para cambiar la resolución acceda a Settings -> Displays -> Resolution

## Crear máquina virtual Ubuntu 22.04 Google Cloud (RECOMENDADO) <a name="crearvm"></a>

1. Acceder a [Google Cloud Compute](https://console.cloud.google.com/compute) con sus credenciales.
2. Crear una nueva instancia:
  - Compute Engine -> Instancias de VM
  - Crear instancia
    - Zona: europe-southwest1-a
    - Disco de arranque:
      - Ubuntu 22.04 LTS Minimal (Arquitectura x86-64)
      - Tamaño 18GB
    - Firewall: permitir tráfico HTTP y HTTPS
3. Clonar este repositorio dentro de la máquina creada:
     ```console
     git clone https://github.com/patriciaOrtuno28/PFINAL-FBID2022.git
     ```
     > Nota: Si la máquina no reconoce el comando git, ejecute el siguiente comando: `sudo apt-get update && sudo apt install -y git`
     
4. Para la realización de esta práctica se utilizará Ubuntu 22.04 Desktop. Para ello, se proporciona un fichero automatizado de instalación de las dependencias necesarias.

     ```console
     chmod 777 desktop.sh
     ```
     Ahora podemos ejecutarlo:
     ```console
     ./desktop.sh
     ```
     
     > Importante: Se le solicitará escoger el *Keyboard Layout*. Si tiene un ordenador con teclado español, escriba 84 y 1 respectivamente.
     
5. Para trabajar con Ubuntu Desktop con interfaz gráfica, en vez de la terminal proporcionada por Google Cloud, descargue [NoMachine](https://downloads.nomachine.com/es/). Tras completar la instalación, se le solicitará reiniciar el dispositivo.
6. 


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

> Nota: Si se pide el reinicio de algún servicio, marque ambas opciones (utilizando la barra espaciadora). Cuando estén marcados (aparecerá un [*]), presione Enter.

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
