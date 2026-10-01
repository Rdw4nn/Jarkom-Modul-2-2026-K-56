#!/bin/bash

cat >> /etc/bind/k56/k56.com << 'EOF'

; nomor 7

vault   IN      A       192.239.1.4
vault   IN      A       192.239.1.5

core    IN      A       192.239.1.6
core    IN      A       192.239.1.7

www     IN      CNAME   penny.k56.com.
static  IN      CNAME   abbey.k56.com.
EOF

service bind9 restart