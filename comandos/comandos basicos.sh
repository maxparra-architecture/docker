#listar imagenes de docker
docker images

########################################################
# DOCKER RUN
########################################################
# -ti para poder interactuar por CLI
docker run -ti [nombre de la imagen]:[TAG]
# --rm para que el docker se elimine una vez se termine el proceso
docker run -rm [nombre de la imagen]:[TAG]
# -d dettached para ejecutar en background
docker run -d [nombre de la imagen]:[TAG]
#--name colocarle un nombre al docker
docker run --name [NOMBRE DEL CONTAINER]-d [nombre de la imagen]:[TAG]
# -p para especificar puertos
docker run -p [outside port]:[inside port]/[protocol]
docker tun -p 1234:1234/udp
#para especificar una network
docker run --network [NOMBRE DE RED]
#Si queremos darle acceso a toda la red del host
docker run --net=host 
#para linkear con otro docker
docker run --rm -ti --link [NOMBRE DEL OTRO DOCKER] --name [NOMBRE DEL DOCKER]
#Para especificar un Volumen
docker run -ti -v [path del directorio]:[path de como vamos a encontrar el volumen dentro del docker] ubuntu bash
#para darle privilegios sudo al docker sobre el host
docker run --privileged=true

#correr el getting starter
docker run -d -p 80:80 docker/getting-started

#listar los docker que se estan ejecutando
docker ps

#Inspeccionar un proceso de un docker
docker inspect [NOMBRE DE DOCKER]

#attach: para entrar al docker dentro de la sesion de la terminal
docker attach [NOMBRE CONTAINER]

#docker logs para ver los logs
docker logs [NOMBRE CONTAINER]

#docker kill matar un docker
docker kill [NOMBRE CONTAINER]

#localhost dentro de los docker
host.docker.internal

#mostrar puertos de un docker
docker port [NOMBRE CONTAINER]

#listar las redes
docker network ls

#crear una red
docker network create [nombre de la red]

#conectar un docker a una red
docker network connect [NOMBRE DE LA RED] [NOMBRE DEL DOCKER]

########################################################
# DOCKER IMAGES
########################################################
#Crear una nueva imagen a partir de un container (por ejemplo si creamos un archivo o alguna configuracion sobre el docker ya corriendo)
docker commit [CONTAINER ID]

#Como el commit da un SHA muy largo, entonces se le coloca un nombre a esa imagen
docker tag  [sha] [NOMBRE DE LA IMAGEN]

#otra forma de hacer una nueva imagen a partir de un container (esta es la que mas se usa)
docker commit [NOMBRE DOCKER] [NOMBRE IMAGEN]:[NOMBRE TAG]

#Estandar que se maneja para los tags
registry.example.com:port/organization/image-name:version-tag

#Eliminar una imagen
docker rmi [NOMBRE DE LA IMAGEN]
docker rm [ID IMAGEN]

#Forzar la eliminación de una imagen
docker rm [ID IMAGEN] -f

#Para trabajar con DockerHub o un Registry
#colocarle un TAG a una imagen local para subirla al registry
docker tag [IMAGE:TAG] [DOCKER HUB USER]/[REPO]:[TAG]
docker tag hola:latest mparraaws/images-training:hola

#push
docker push [DOCKER HUB USER]/[REPO]

#pull
docker pull [DOCKER HUB USER]/[REPO]:[TAG]

########################################################
# DOCKER VOLUMES
########################################################
#Hay dos opciones Persistente o Ephimeral
#PERSISTENTE
#Para especificar un Volumen
docker run -ti -v [path del directorio]:[path de como vamos a encontrar el volumen dentro del docker] ubuntu bash

#EPHIMERAL
#volumes-from compartir volumen entre los docker
#1. Creo el volumen en el primer docker
docker run -ti -v /[NOMBRE DEL VOLUMEN] ubuntu bash
#2. Cuando creo el segundo docker le especifico que quiero asignarle los volumenes del primer docker
docker run -ti --volumes-from [NOMBRE PRIMER DOCKER] ubuntu bash


########################################################
# DOCKER BUILD
########################################################
#Crear una imagen a partir de un dockerfile. Esto funciona parados en la carpeta donde esta el docker file
docker build -t [NOMBRE DE LA IMAGEN] .


########################################################
# DOCKER SWARM
########################################################
#https://docs.docker.com/engine/reference/commandline/swarm/
#Inicializar el docker swarm. Este comando se debe ejecutar en el nodo lider.
docker swarm init

#si tenemos varias interfaces de red, nos toca especificar cual vamos a dedicar al docker swarm
docker swarm init --advertise-addr fdb2:2c26:f4e4:0:8c19:4fbd:928f:64d8

#Para agregar un nodo al swarm cluster. Ejecutar esto en el nodo que se quiere agregar al cluster
docker swarm join --token [TOKEN]

#para agregar un nodo manager al swarm cluster ejecutar el siguiente comando en el nodo principal y despues coger el comando que da y ejecutarlo en el nodo que se quiere agregar.
docker swarm join-token manager

#para ver los nodos que hacen parte del swarm cluster
docker node ls

#desplegar una app (se conoce como service) en el cluster de swarm
docker service create --name[NOMBRE DEL SERVICIO] --replicas=[NUMERO DE REPLICAS] [IMAGEN]
#Ejemplo
docker service create --name webapp1 --replicas=6 ngnix

#para ver los servicios corriendo en el cluster
docker service ls

#para ver los docker corriendo
docker ps

