#listar imagenes de docker
docker images

#DOCKER RUN
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

#correr el getting starter
docker run -d -p 80:80 docker/getting-started

#listar los docker que se estan ejecutando
docker ps

#Crear una nueva imagen a partir de un container (por ejemplo si creamos un archivo o alguna configuracion sobre el docker ya corriendo)
docker commit [CONTAINER ID]

#Como el commit da un SHA muy largo, entonces se le coloca un TAG a esa imagen
docker tag  [sha] [nombre del TAG]

#otra forma de hacer una nueva imagen a partir de un container (esta es la que mas se usa)
docker commit [NOMBRE CONTAINER] [TAG]

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