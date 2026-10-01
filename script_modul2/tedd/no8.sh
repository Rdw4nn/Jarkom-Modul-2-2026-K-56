#!/bin/bash

cat >> /etc/bind/named.conf.local << 'EOF'

zone "1.239.192.in-addr.arpa" {
    type slave;

    masters {
        192.239.1.2;
    };

    file "/var/cache/bind/rev.192.239.1";
};

zone "2.239.192.in-addr.arpa" {
    type slave;

    masters {
        192.239.1.2;
    };

    file "/var/cache/bind/rev.192.239.2";
};

zone "3.239.192.in-addr.arpa" {
    type slave;

    masters {
        192.239.1.2;
    };

    file "/var/cache/bind/rev.192.239.3";
};
EOF

service bind9 restart