#!/bin/env bash

[[ -f /root/certificates ]] && exit

answers() {
    echo --
    echo State
    echo City
    echo openStack
    echo quickstack.$1
    echo $FQDN
    echo admin@${FQDN}
    echo
    echo
}

private_CA() {
    # Setup
    umask 277
    cd /etc/pki/CA
    echo 01 > serial
    touch index.txt

   # Generate a private key
    openssl genrsa -out private/cakey.pem 2048 2> /dev/null

    # Generate a self-signed CA certificate
    answers | openssl req -new -x509 -key private/cakey.pem -days 365 -out cacert.pem

    chmod 755 cacert.pem
}

signed_cert() {
    # $1 Certificate name
    # $2 Common name suffix

    KEY=/etc/pki/tls/private/${1}.key
    CERT=/etc/pki/tls/certs/${1}.crt
    CSR=/etc/pki/tls/${1}.csr

    openssl genrsa -out $KEY 2048 2> /dev/null
    answers $2 | openssl req -new -nodes -key $KEY -out ${CSR}
    yes | openssl ca -in ${CSR} -out ${CERT}
    rm -f $CSR
    chmod 755 $KEY $CERT
}

FQDN=`hostname`
if [ "x${FQDN}" = "x" ]; then
   FQDN=localhost.localdomain
fi

private_CA
signed_cert $FQDN-amqp amqp
signed_cert $FQDN-horizon horizon
signed_cert $FQDN-mysql mysql

touch /root/certificates
