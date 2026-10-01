#!/bin/bash

apt-get update
apt-get install nginx php-fpm -y

service php8.4-fpm start

mkdir -p /var/www/core

cat > /var/www/core/index.php << 'EOF'
<?php
echo "<h1>Beranda Core</h1>";
echo "<p>Selamat datang di core.k56.com</p>";
echo '<a href="/profil">Ke Halaman Profil</a>';
?>
EOF

cat > /var/www/core/profil.php << 'EOF'
<?php
echo "<h1>Profil</h1>";
echo "<p>Ini adalah halaman profil core.k56.com</p>";
echo '<a href="/">Kembali ke Beranda</a>';
?>
EOF

chmod -R 755 /var/www/core

cat > /etc/nginx/sites-available/core << 'EOF'
server {
    listen 80;
    server_name core.k56.com;

    root /var/www/core;
    index index.php;

    location / {
        try_files $uri $uri/ @rewrite;
    }

    location @rewrite {
        rewrite ^/profil$ /profil.php last;
        rewrite ^/$ /index.php last;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }
}
EOF

ln -sf /etc/nginx/sites-available/core /etc/nginx/sites-enabled/core
rm -f /etc/nginx/sites-enabled/default

service php8.4-fpm start
service nginx restart