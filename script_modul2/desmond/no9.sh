#!/bin/bash

apt-get update
apt-get install apache2 -y

apache2ctl start

mkdir -p /arsip

echo "File arsip dari DESMOND" > /arsip/desmond.txt
echo "Dokumen 1" > /arsip/dokumen1.txt
echo "Dokumen 2" > /arsip/dokumen2.txt

chmod -R 755 /arsip

cat > /etc/apache2/sites-available/vault.conf << 'EOF'
<VirtualHost *:80>
    ServerName vault.k56.com

    DocumentRoot /arsip

    <Directory /arsip>
        Options +Indexes
        AllowOverride None
        Require all granted
    </Directory>

    DirectoryIndex disabled
</VirtualHost>
EOF

a2ensite vault.conf
service apache2 restart