#!/bin/bash

CMD1='cat /etc/hostname; \
sudo ip link set up eth0;\
sudo ip link set down eth1;\
sudo ip link set down eth2;\
sudo ifconfig eth1 hw ether 00:00:00:00:01:11;\
sudo ifconfig eth2 hw ether 00:00:00:00:01:11;\
sudo ip link set up eth1;\
sudo ip link set up eth2;\
sudo vconfig add team0 11; \
sudo ifconfig team0 hw ether 00:00:00:00:01:11;\
sudo ifconfig team0.11 10.10.11.101 netmask 255.255.255.0; \
sudo ip link set up team0.11; \
sudo ip route add 10.10.11.0/24 via 10.10.11.1 dev team0.11; \
sudo ifconfig team0.11; \
sudo teamdctl team0 state; \
sudo lldpad -d;\
sudo lldptool set-lldp -i eth1 adminStatus=rxtx;\
sudo lldptool -T -i eth1 -V sysName enableTx=yes;\
sudo lldptool -T -i eth1 -V portDesc enableTx=yes;\
sudo lldptool -T -i eth1 -V sysDesc enableTx=yes;\
sudo lldptool set-lldp -i eth2 adminStatus=rxtx;\
sudo lldptool -T -i eth2 -V sysName enableTx=yes;\
sudo lldptool -T -i eth2 -V portDesc enableTx=yes;\
sudo lldptool -T -i eth2 -V sysDesc enableTx=yes;\
sudo route -n' \

CMD2='cat /etc/hostname; \
sudo ip link set up eth0;\
sudo ip link set down eth1;\
sudo ip link set down eth2;\
sudo ifconfig eth1 hw ether 00:00:00:00:02:22;\
sudo ifconfig eth2 hw ether 00:00:00:00:02:22;\
sudo vconfig add team0 11;\
sudo ip link set up eth1;\
sudo ip link set up eth2;\
sudo ifconfig team0 hw ether 00:00:00:00:02:22;\
sudo ifconfig team0.11 10.10.11.102 netmask 255.255.255.0;\
sudo ip link set up team0.11; \
sudo ip route add 10.10.11.0/24 via 10.10.11.1 dev team0.11; \
sudo ifconfig team0.11; \
sudo teamdctl team0 state;\
sudo lldpad -d;\
sudo lldptool set-lldp -i eth1 adminStatus=rxtx;\
sudo lldptool -T -i eth1 -V sysName enableTx=yes;\
sudo lldptool -T -i eth1 -V portDesc enableTx=yes;\
sudo lldptool -T -i eth1 -V sysDesc enableTx=yes;\
sudo lldptool set-lldp -i eth2 adminStatus=rxtx;\
sudo lldptool -T -i eth2 -V sysName enableTx=yes;\
sudo lldptool -T -i eth2 -V portDesc enableTx=yes;\
sudo lldptool -T -i eth2 -V sysDesc enableTx=yes;\
sudo route -n' \





echo "[INFO] Configuring host1"
sudo docker exec -it  host1 /bin/sh -c "$CMD1"

echo "[INFO] Configuring host2"
sudo docker exec -it  host2 /bin/sh -c "$CMD2"


echo "[INFO] Completed"