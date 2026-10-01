#!/bin/bash

echo "======================================"
echo "       TEST NO. 13 - REDIRECT"
echo "======================================"

echo
echo "[1] Request menggunakan IP Penny"
echo "--------------------------------------"

curl -sS -I \
    -H "Host: 192.239.3.2" \
    http://192.239.3.2/

echo
echo "[2] Request menggunakan hostname"
echo "--------------------------------------"

curl -sS -I \
    -H "Host: penny.k56.com" \
    http://192.239.3.2/

echo
echo "======================================"
echo "             TEST SELESAI"
echo "======================================"