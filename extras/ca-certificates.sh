curl https://curl.haxx.se/ca/cacert.pem -o cacert.pem
curl https://curl.haxx.se/ca/cacert.pem.sha256 -o cacert.pem.sha256

sha256sum -c cacert.pem.sha256

mkdir -p ${TOOLCHAIN}/etc/ssl/certs
mv cacert.pem ${TOOLCHAIN}/etc/ssl/certs/ca-certificates
