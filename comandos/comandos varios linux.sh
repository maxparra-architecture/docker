#Instalar netcat en ubuntu
apt-get update
apt-get install netcat

#echo server con netcat
nc -lp 45678 | nc -lp 45679

#clientes terminales con netcat
nc localhost 45678
nc localhost 45679

