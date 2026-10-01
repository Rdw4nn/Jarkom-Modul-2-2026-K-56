cat > /root/test-no19.sh <<'EOF'
#!/bin/bash

echo "======================================"
echo "   TEST NO. 19 - CNAME OUTBOUND"
echo "======================================"

echo
echo "[1] Cek CNAME"
echo "--------------------------------------"

dig outbound.k56.com CNAME +noall +answer

echo
echo "[2] Cek IP hasil resolusi"
echo "--------------------------------------"

dig outbound.k56.com A +noall +answer

echo
echo "[3] Cek target CNAME"
echo "--------------------------------------"

dig http.badssl.com A +noall +answer

echo
echo "[4] HTTP Request"
echo "--------------------------------------"

curl -I --max-time 10 http://outbound.k56.com/

echo
echo "======================================"
echo "          TEST SELESAI"
echo "======================================"
EOF

chmod +x /root/test-no19.sh