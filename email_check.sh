#!/bin/bash

while read -r email; do
  res=$(curl -s -X POST "https://login.microsoftonline.com/common/GetCredentialType" \
    -H "Content-Type: application/json" \
    -d "{\"Username\":\"$email\"}")

  if echo "$res" | grep -q '"IfExistsResult":0'; then
    echo "[VALID] -> $email"
  else
    echo "[INVALID/NOT FOUND] -> $email"
  fi
done < epostalar.txt