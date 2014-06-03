echo "Parameters: App name, unsigned exe location"
set -o verbose
openssl pkcs12 -in CELCodeSigningCert.pfx -nocerts -nodes -out key.pem -passin file:pwd.txt
openssl rsa -in key.pem -outform PVK -pvk-strong -out CELCodeSigningCert.pvk -passin file:pwd.txt -passout file:pwd.txt
openssl pkcs12 -in CELCodeSigningCert.pfx -nokeys -nodes -out cert.pem  -passin file:pwd.txt
openssl crl2pkcs7 -nocrl -certfile cert.pem -outform DER -out CELCodeSigningCert.spc
ls -al
signcode -spc CELCodeSigningCert.spc -v CELCodeSigningCert.pvk -a sha1 -$ commercial -n $1 -i "http://www.cel-robox.com/" -t http://timestamp.verisign.com/scripts/timstamp.dll -tr 10 $2 < pwd.txt
