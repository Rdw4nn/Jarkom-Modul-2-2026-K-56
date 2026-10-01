cat > /root/test-no20.sh <<'EOF'
#!/bin/bash

echo "======================================"
echo "      TEST NO. 20 - FINAL CHECK"
echo "======================================"

echo
echo "[1] BIND9"
systemctl is-enabled bind9
systemctl is-active bind9

echo
echo "[2] DNS ABBEY"
dig @192.239.1.2 abbey.k56.com A +noall +answer

echo
echo "[3] DNS SERIAL"
dig @192.239.1.2 k56.com SOA +short

echo
echo "======================================"
echo "        FINAL CHECK SELESAI"
echo "======================================"
EOF

chmod +x /root/test-no20.sh