#!/bin/bash
rm key.txt
touch key.txt
rm key.txt
tput setaf 3;echo "1. Start code generat"
curl -d "gatInviteCode()" -X POST https://www.hackthebox.eu/api/invite/generate > key.txt
echo "2. Generated code 100%"

echo "4. Decrypting Base64"
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
grep -o '[A-Za-z0-9]*=' key.txt | base64 -d > invitecode.txt
tput setaf 1;echo "==========================================================="
tput setaf 2;echo "hackthebox.eu invite code is: $(<invitecode.txt)"
tput setaf 1;echo "==========================================================="
tput setaf 4;echo "file: invitecode.txt"
exit $?

