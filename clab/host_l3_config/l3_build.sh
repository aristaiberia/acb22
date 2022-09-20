#!/bin/bash


CMD1='cat /etc/hostname; \
sudo vconfig add team0 11; \
sudo ifconfig team0.11 10.10.11.101 netmask 255.255.255.0;\
sudo ip link set up team0.11; \
sudo ip route add 10.10.11.0/24 via 10.10.11.1 dev team0.11; \
sudo ifconfig team0.11; \
sudo route -n'

CMD2='cat /etc/hostname; \
sudo vconfig add team0 11; \
sudo ifconfig team0.11 10.10.11.102 netmask 255.255.255.0;\
sudo ip link set up team0.11; \
sudo ip route add 10.10.11.0/24 via 10.10.11.1 dev team0.11; \
sudo ifconfig team0.11; \
sudo route -n'


echo "[INFO] Configuring clab-ceostopo2-host1"
docker exec -it  clab-ceostopo1-host1 /bin/sh -c "$CMD1"

echo "[INFO] Configuring clab-ceostopo2-host2"
docker exec -it  clab-ceostopo1-host2 /bin/sh -c "$CMD2"


echo "[INFO] Completed"