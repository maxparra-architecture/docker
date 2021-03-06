#Instalar netcat en ubuntu
apt-get update
apt-get install netcat

#Instalar ping en ubuntu
apt-get update
apt install iputils-ping

#Una variante para instalar las cosas y forzarlo a que le diga que SI  a todo
apt-get -y update
apt install -y iputils-ping

#echo server con netcat
nc -lp 45678 | nc -lp 45679

#clientes terminales con netcat
nc localhost 45678
nc localhost 45679

#Instalar utilities de brdige
apt-get install bridge-utils

#mostrar los bridges
brctl show

#mostrar tablas de ip
apt-get install iptables
sudo iptables -n -L -t nat

#para subir a root en ubuntu y no tener que escribir sudo todo el tiempo
sudo su -

#Cambiar el hostname en ubuntu
hostname [NUEVO NOMBRE DE HOSTNAME]

#Verficar el hostname
hostname