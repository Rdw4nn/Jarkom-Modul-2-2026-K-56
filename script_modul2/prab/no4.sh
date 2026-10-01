#!/bin/bash

apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9


mkdir -p /etc/bind/k56

cat > /etc/bind/named.conf.local << 'EOF'
zone "k56.com" {
    type master;
    file "/etc/bind/k56/k56.com";

    allow-transfer {
        192.239.1.3;
    };

    notify yes;
};
EOF

cat > /etc/bind/k56/k56.com << 'EOF'
$TTL    604800

@       IN      SOA     prab.k56.com. root.k56.com. (
                        2026092901
                        604800
                        86400
                        2419200
                        604800 )
;

@       IN      NS      prab.k56.com.
@       IN      NS      tedd.k56.com.

prab    IN      A       192.239.1.2
tedd    IN      A       192.239.1.3

@       IN      A       192.239.3.2
EOF

cat > /etc/bind/named.conf.options << 'EOF'
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

    allow-query { any; };
    auth-nxdomain no;
    listen-on { any; };
    listen-on-v6 { any; };
};
EOF

service bind9 restart

cat > //etc/resolv.conf << 'EOF'
nameserver 192.239.1.2
nameserver 192.239.1.3
nameserver 192.168.122.1
EOF