#!/bin/bash

cat > /etc/network/interfaces << 'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.239.2.2
    netmask 255.255.255.0
    gateway 192.239.2.1
EOF

ip link set eth0 up
ip addr flush dev eth0
ip addr add 192.239.2.2/24 dev eth0

ip route del default 2>/dev/null
ip route add default via 192.239.2.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf