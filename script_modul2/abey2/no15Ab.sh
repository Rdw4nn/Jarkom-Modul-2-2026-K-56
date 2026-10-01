cat > /root/no15-abbey.sh <<'EOF'
#!/bin/bash

echo "======================================"
echo " NO. 15 - ORION - ABBEY"
echo "======================================"

echo
echo "[1] Membuat direktori /orion"

mkdir -p /var/www/html/orion

echo
echo "[2] Membuat halaman statis"

cat > /var/www/html/orion/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>Orion</title>
</head>
<body>
    <h1>Orion endpoint aktif di Abbey</h1>
    <p>Halaman ini merupakan static content.</p>
</body>
</html>
HTML

echo
echo "[3] Memastikan permission"

chown -R www-data:www-data /var/www/html/orion
chmod -R 755 /var/www/html/orion

echo
echo "[4] Cek konfigurasi Nginx"

nginx -t

echo
echo "[5] Restart Nginx"

service nginx restart

echo
echo "======================================"
echo " KONFIGURASI ABBEY SELESAI"
echo "======================================"
EOF

chmod +x /root/no15-abbey.sh