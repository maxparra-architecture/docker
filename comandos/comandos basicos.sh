#listar imagenes de docker
docker images

#correr un container
docker run -ti [nombre de la imagen]:[TAG]

#correr el getting starter
docker run -d -p 80:80 docker/getting-started

#listar los docker que se estan ejecutando
docker ps

#Crear una nueva imagen a partir de un container (por ejemplo si creamos un archivo o alguna configuracion sobre el docker ya corriendo)
docker commit [CONTAINER ID]

#Como el commit da un SHA muy largo, entonces se le coloca un TAG a esa imagen
docker tag  [sha] [nombre del TAG]
