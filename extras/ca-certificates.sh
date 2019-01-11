mkdir -p ${TOOLCHAIN}/etc/ssl/certs
curl https://curl.haxx.se/ca/cacert.pem -o ${TOOLCHAIN}/etc/ssl/certs/ca-certificates
