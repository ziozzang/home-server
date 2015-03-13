#!/bin/bash
# Shell script by Jio L. Jung(ziozzang@gmail.com)

IPT=/sbin/iptables
DOCKER_IF=docker0
iptables-save | grep -v "portford" | iptables-restore

while read line
do
  if [ -n  "${line}" ]; then
    if [ ${line:0:1} != "#" ]; then
      echo "$line"
      IFS='   ' read -a array <<< "$line"
      IP_ADDR=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${array[3]} 2> /dev/null`
      if [ -n "${IP_ADDR}" ]; then
        echo ">> DNAT// External: ${array[1]}-> ${array[3]}: '${IP_ADDR}:${array[2]}'"
        /sbin/iptables -t nat -A DOCKER -m comment --comment "portford" ! -i ${DOCKER_IF} -p ${array[0]} --dport ${array[1]} -j DNAT --to-destination ${IP_ADDR}:${array[2]}
      else
        echo ">> ${array[3]} -> No such container"
      fi      
    fi
  fi
done < ports
