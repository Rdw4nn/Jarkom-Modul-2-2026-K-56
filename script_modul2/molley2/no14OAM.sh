#!/bin/bash

echo "======================================"
echo " NO. 14 - ORIGINAL CLIENT IP - NGINX"
echo "======================================"

echo
echo "[1] Membuat konfigurasi Real IP"

cat > /etc/nginx/conf.d/realip.conf <<'CONF'
set_real_ip_from 192.239.2.2;
real_ip_header X-Real-IP;
real_ip_recursive on;
CONF

echo
echo "[2] Cek konfigurasi Nginx"

nginx -t

echo
echo "[3] Reload Nginx"

service nginx reload

echo
echo "======================================"
echo " KONFIGURASI NGINX SELESAI"
echo "======================================"