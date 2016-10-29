#!/bin/bash

tiempo="$(uptime)";
now=$(date);
host=$(ip addr show | grep -i 'inet ');
host="";
usoDatos1="$(/sbin/ifconfig enp2s0 | grep -i 'RX b')"
usoDatos2="$(/sbin/ifconfig enp3s2 | grep -i 'RX b')"

cpu=$(exec sensors | grep 'Core ' | cut -c16-21 | awk '{ printf " %s °C\t" ,$1}')
disco=$(exec hddtemp /dev/sda | cut -c30-40 )
consumoDiscoRaiz=$(df --human-readable | grep "/dev/sda1")
consumoDiscoHome=$(df --human-readable | grep "/dev/sda5")


memUsada="$(free -m | grep -i 'mem:' | cut -c24-39)";
memLibre="$(free -m | grep -i 'mem:' | cut -c70-90)";

to="info-server";
subject="Server";
body="Informacion General";


cd "/home/server/tg/";
echo "$(pwd)"
all="nuevo mensaje=================================================================================================================================================================================================================================================================================================================================";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli



all="de: $subject ////  $body  //// Fecha:$now  //// conexiones: $host ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli


all="Tiempo Encendida: $tiempo ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli



all="Temperatura CPU: $cpu ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli


all="Memoria Usada: $memUsada ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli



all="Memoria Libre: $memLibre ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli


all="Consumo disco duro Raiz: $consumoDiscoRaiz ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli


all="Consumo disco duro Home: $consumoDiscoHome ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli


all="Temperatura de Disco: $disco ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli


all="enp2s0: $usoDatos1  ------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli

all="enp3s2: $usoDatos2 ---------------------------";
(echo "dialog_list"; sleep 7; echo "msg $to $all"; echo "quit")   | bin/telegram-cli






