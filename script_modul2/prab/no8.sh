#!/bin/bash

cat >> /etc/bind/named.conf.local << 'EOF'

zone "1.239.192.in-addr.arpa" {
    type master;
    file "/etc/bind/k56/rev.192.239.1";

    allow-transfer {
        192.239.1.3;
    };

    notify yes;
};

zone "2.239.192.in-addr.arpa" {
    type master;
    file "/etc/bind/k56/rev.192.239.2";

    allow-transfer {
        192.239.1.3;
    };

    notify yes;
};

zone "3.239.192.in-addr.arpa" {
    type master;
    file "/etc/bind/k56/rev.192.239.3";

    allow-transfer {
        192.239.1.3;
    };

    notify yes;
};
EOF


cat > /etc/bind/k56/rev.192.239.1 << 'EOF'
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

4       IN      PTR     vault.k56.com.
5       IN      PTR     vault.k56.com.

6       IN      PTR     core.k56.com.
7       IN      PTR     core.k56.com.
EOF


cat > /etc/bind/k56/rev.192.239.2 << 'EOF'
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

2       IN      PTR     abbey.k56.com.
EOF


cat > /etc/bind/k56/rev.192.239.3 << 'EOF'
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

2       IN      PTR     penny.k56.com.
EOF

service bind9 restart