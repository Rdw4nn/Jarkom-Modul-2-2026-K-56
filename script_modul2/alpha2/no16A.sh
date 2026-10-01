cat > /root/test-no16.sh <<'EOF'
#!/bin/bash

echo "======================================"
echo "   TEST NO. 16 - APACHEBENCH"
echo "======================================"

echo
echo "[1] TEST www.k56.com"
echo "--------------------------------------"

ab -n 250 -c 10 \
   -H "Host: www.k56.com" \
   http://192.239.3.2/

echo
echo "======================================"
echo "[2] TEST static.k56.com"
echo "======================================"

ab -n 250 -c 10 \
   -H "Host: static.k56.com" \
   http://192.239.2.2/

echo
echo "======================================"
echo "          TEST SELESAI"
echo "======================================"
EOF

chmod +x /root/test-no16.sh