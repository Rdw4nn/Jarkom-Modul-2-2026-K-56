#!/bin/bash

echo "======================================"
echo "   NO. 11 - REVERSE PROXY ABBEY"
echo "======================================"

echo
echo "[1] Membuat konfigurasi reverse proxy"

cat > /etc/nginx/sites-available/core-proxy <<'CONF'
upstream core_backend {
    server 192.239.1.6;
    server 192.239.1.7;
}

server {

    listen 80;

    server_name core.k56.com;

    location / {

        proxy_pass http://core_backend;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

    }
}
CONF

echo
echo "[2] Enable site"

ln -sf /etc/nginx/sites-available/core-proxy \
       /etc/nginx/sites-enabled/core-proxy

echo
echo "[3] Cek konfigurasi Nginx"

nginx -t

echo
echo "[4] Restart Nginx"

service nginx restart

echo
echo "======================================"
echo "   ABBEY SELESAI DIKONFIGURASI"
echo "======================================"