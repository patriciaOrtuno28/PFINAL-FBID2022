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

1. Acceder a Google Cloud con sus credenciales
2. Crear una nueva instancia:
  - Compute Engine -> Instancias de VM
  - Crear instancia
    - Zona: europe-southwest1-a
    - Disco de arranque:
      - Ubuntu 22.04 LTS Pro Server (Arquitectura x86-64)
      - Tamaño 18GB
    - Firewall: permitir tráfico HTTP y HTTPS
3. Clonar este proyecto dentro de la máquina creada o subir los archivos manualmente
```console
git clone https://github.com/patriciaOrtuno28/fbid.git
```
4. Para la realización de esta práctica se utilizará Ubuntu 22.04 Desktop. Para ello, se proporciona un fichero automatizado de instalación de las dependencias necesarias.

     ```console
     chmod 777 desktop.sh
     ```
     Ahora podemos ejecutarlo:
     ```console
     ./desktop.sh
     ```
     Tras ejecutarlo, verá que se ha hecho reboot. Por tanto, haga clic en `Reintentar` para volver a acceder a la máquina por SSH.
     Entonces ejecute el siguiente comando:
     ```
     sudo service slim start
     ```
 5. Acceda a [Chrome Remote Desktop](https://remotedesktop.google.com/headless) para la configuración de Ubuntu 22.04 Desktop.
 
     - Haga clic en Configurar otra página de ordenador: `Empezar` -> `Siguiente` -> `Autorizar`
     - En Configurar otro ordenador copie el contenido de `Debian Linux`
     - Pegue dicho comando en la instancia abierta por SSH de su máquina virtual
     - Se le solicitará introducir un PIN de 6 dígitos. Introduzca el que desee y recuérdelo.
     - Si todo ha funcionado satisfactoriamente, verá el siguiente mensaje en la terminal:
     ```
     [1110/181949.990461:INFO:daemon_controller_delegate_linux.cc(98)] Created symlink /etc/systemd/system/multi-user.target.wants/chrome-remote-desktop@patiortu.service → /lib/systemd/system/chrome-remote-desktop@.service.
     ```
     - Vuelva a entrar en Chrome Remote Desktop y acceda a `Acceso remoto`
     - Verá que ha aparecido la instancia que creó en Google Cloud. Haga clic sobre ella e introduzca el PIN que creó.
     - Si le solicita autenticación al abrirse el escritorio remoto, haga clic en cancelar.


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
