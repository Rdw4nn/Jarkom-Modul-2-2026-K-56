#!/bin/bash

apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

cat > /etc/bind/named.conf.local << 'EOF'
zone "k56.com" {
    type slave;

    masters {
        192.239.1.2;
    };

    file "/var/cache/bind/db.k56.com";
};
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