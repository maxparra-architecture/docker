#FROM indica desde cual imagen se parte. Debe ser el primer comando en un dockerfile.
FROM ubuntu:sid

#MAINTAINER define el actor
MAINTAINER Max Parra mparra.aws@gmail.com

#RUN para ejecutar comandos y guardar resultados
RUN unzip install.zip /opt/install/

#ADD se usa para adicionar archivos locales o para agregare archivos a tar
ADD run.sh/run.sh

#ENV para setear variables de entorno
ENV DB_HOST = db.production.example.com

#ENTRYPOINT para ejecutar comandos pero se indica desde donde inicia
ENTRYPOINT nano.txt

#CMD para ejecutar comandos en general
CMD nano.txt

#EXPOSE para exponer puertos
EXPOSE 8080

#VOLUME para definir volumenes compartidos o ephimeral
VOLUME ["/host/path" "/container/path"]
VOLUME ["/shared-data"]

#WORKDIR indica el directorio donde se ubica luego que inicia el container
WORKDIR /install/

#USER para indicar el usuario con el que se va a utilizar el container
USER arthur

