#!/bin/bash

cat > /etc/network/interfaces << 'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.122.2
    netmask 255.255.255.0
    gateway 192.168.122.1

auto eth1
iface eth1 inet static
    address 192.239.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.239.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 192.239.3.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 192.239.4.1
    netmask 255.255.255.0

auto eth5
iface eth5 inet static
    address 192.239.5.1
    netmask 255.255.255.0
EOF

ip link set eth0 up
ip link set eth1 up
ip link set eth2 up
ip link set eth3 up
ip link set eth4 up
ip link set eth5 up

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3
ip addr flush dev eth4
ip addr flush dev eth5

ip addr add 192.168.122.2/24 dev eth0
ip addr add 192.239.1.1/24 dev eth1
ip addr add 192.239.2.1/24 dev eth2
ip addr add 192.239.3.1/24 dev eth3
ip addr add 192.239.4.1/24 dev eth4
ip addr add 192.239.5.1/24 dev eth5

ip route del default 2>/dev/null
ip route add default via 192.168.122.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

sysctl -w net.ipv4.ip_forward=1

iptables -F FORWARD
iptables -t nat -F

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth4 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth5 -o eth0 -j ACCEPT

iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT