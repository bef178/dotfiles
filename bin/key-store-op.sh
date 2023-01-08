#!/bin/bash

# $KEY_NAME.pub.pk1.pem      PKCS#1 RSAPublicKey             -----BEGIN RSA PUBLIC KEY-----
# $KEY_NAME.pk1.pem          PKCS#1 RSAPrivateKey            -----BEGIN RSA PRIVATE KEY-----
# $KEY_NAME.pub.x509.pem     X.509 SubjectPublicKeyInfo      -----BEGIN PUBLIC KEY-----
# $KEY_NAME.x509.pem         Certificate not X.509           -----BEGIN CERTIFICATE-----
# $KEY_NAME.pk8.pem          PKCS#8 PrivateKeyInfo           -----BEGIN PRIVATE KEY-----
# $KEY_NAME.pk8.pem          PKCS#8 EncryptedPrivateKeyInfo  -----BEGIN ENCRYPTED PRIVATE KEY-----
# $KEY_NAME.pub              OpenSSH compatible public key   rfc4253#6.6
# XML <RSAKeyPair> and <RSAKeyValue>

# platform, media, shared: MD5withRSA
# testkey, verity: SHA1withRSA
# androiddebugkey: SHA256withRSA

########################################

function mk_jks() {
    keytool -genkeypair -v \
        -keystore $STORE_NAME.jks \
        -storepass $STORE_PASS \
        -dname "C=CN,O=x,OU=$KEY_NAME,CN=pd" \
        -alias $KEY_NAME \
        -keypass $KEY_PASS \
        -keyalg RSA -keysize 2048 \
        -validity 7305
}

function ls_jks() {
    keytool -list -v \
        -keystore $STORE_NAME.jks \
        -storepass $STORE_PASS \
        #-alias $KEY_NAME
}

function mv_jks_p12() {
    keytool -importkeystore -v \
        -srckeystore $STORE_NAME.jks -srcstoretype jks \
        -srcstorepass $STORE_PASS \
        -srcalias $KEY_NAME -srckeypass $KEY_PASS \
        -destkeystore $STORE_NAME.p12 -deststoretype pkcs12 \
        -deststorepass $STORE_PASS \
        -destalias $KEY_NAME -destkeypass $KEY_PASS
}

function ls_p12() {
    keytool -list -v \
        -keystore $STORE_NAME.p12 -storetype pkcs12 \
        -storepass $STORE_PASS \
        -alias $KEY_NAME
    #openssl pkcs12 \
    #    -in $STORE_NAME.p12 -passin pass:$STORE_PASS \
    #    -passout pass: 2>/dev/null \
    #    | openssl x509 -noout -text
}

function mv_p12_jks() {
    keytool -importkeystore -v \
        -srckeystore $STORE_NAME.p12 \
        -srcstoretype pkcs12 \
        -srcstorepass $STORE_PASS \
        -srcalias $KEY_NAME -srckeypass $KEY_PASS \
        -destkeystore $STORE_NAME.jks \
        -deststoretype jks \
        -deststorepass $STORE_PASS \
        -destalias $KEY_NAME -destkeypass $KEY_PASS
}

# p12 --> all-in-one PEM
function mv_p12_pem() {
    openssl pkcs12 \
        -in $STORE_NAME.p12 -passin pass:$STORE_PASS \
        -out $STORE_NAME.pem -nodes
}

# p12 --> X.509 Certificate PEM, only the first
function mv_p12_cert {
    openssl pkcs12 -clcerts \
        -in $STORE_NAME.p12 \
        -passin pass:$STORE_PASS \
        -passout pass: \
        | openssl x509 \
            -out $STORE_NAME.x509.pem
}

# p12 --> pk8.pem, only the first
function mv_p12_pk8 {
    openssl pkcs12 -cacerts \
        -in $STORE_NAME.p12 -passin pass:$STORE_PASS \
        -nodes \
        | openssl pkcs8 \
            -nocrypt \
            -out $KEY_NAME.pk8.pem
}

# X.509 Certificate PEM + .pk8.pem --> .p12
function mv_pk8_p12() {
    openssl pkcs12 -export \
        -in $KEY_NAME.x509.pem -inkey $KEY_NAME.pk8.pem \
        -out $STORE_NAME.pk12 -passout pass:$STORE_PASS \
        -name $KEY_NAME
}

########################################

# pk1 --> pk8
function mv_pk1_pk8() {
    openssl pkcs8 -topk8 \
        -in $KEY_NAME.pk1.pem -passin pass:$KEY_PASS \
        -out $KEY_NAME.pk8.pem -nocrypt
}

# pk8 --> pk1
function mv_pk8_pk1() {
    openssl rsa \
        -in $KEY_NAME.pk8.pem \
        -out $KEY_NAME.pk1.pem
}

# pk1 --> pub
function mv_pk1_pub() {
    ssh-keygen -f $KEY_NAME.pk1.pem -y >$KEY_NAME.pub
}

# pk8 --> pub
function mv_pk8_pub() {
    ssh-keygen -f $KEY_NAME.pk8.pem -y >$KEY_NAME.pub
}

# show ssh fingerprint and randomart
function ls_pub() {
    ssh-keygen -lvf $KEY_NAME.pub
}

# pub --> pub.pk1
function mv_pub_pk1pub() {
    ssh-keygen -f $KEY_NAME.pub -e -m pem \
        >$KEY_NAME.pub.pk1.pem
}

function mv_pk1pub_x509pub() {
    openssl rsa -RSAPublicKey_in \
        -in $KEY_NAME.pub.pk1.pem \
        -pubout \
        >$KEY_NAME.pub.x509.pem
}

function mv_x509pub_pk1pub() {
    openssl rsa \
        -in $KEY_NAME.pub.x509.pem -pubin \
        -RSAPublicKey_out \
        >$KEY_NAME.pub.pk1.pem
}

# pub.x509 --> pub
function mv_x509pub_pub() {
    ssh-keygen -i -m pkcs8 -f $KEY_NAME.pub.x509.pem \
        >$KEY_NAME.pub
    #echo -n "ssh-rsa " > $KEY_NAME.pub;
    #\grep -v -- ----- $KEY_NAME.pub.x509.pem \
    #    | base64 -d \
    #    | dd bs=1 skip=32 count=257 status=none \
    #    | xxd -p -c257 \
    #    | sed s/^/00000007\ 7373682d727361\ 00000003\ 010001\ 00000101\ / \
    #    | xxd -p -r \
    #    | base64 -w0 \
    #    >>$KEY_NAME.pub
    #echo >> $KEY_NAME.pub
}

function mv_pk8der_pk8pem() {
    openssl pkcs8 \
        -in $KEY_NAME.pk8 -inform DER \
        -out $KEY_NAME.pk8.pem -nocrypt
}

function mv_pk8pem_pk8der() {
    openssl pkcs8 \
        -in $KEY_NAME.pk8.pem -nocrypt \
        -out $KEY_NAME.pk8 -outform DER
}

# pk8 --> certificate
function mv_pk8_cert() {
    openssl req \
        -x509 -newkey rsa:2048 -subj '/' -days 7 \
        -keyout $KEY_NAME.pk8.pem -nodes \
        -out $KEY_NAME.x509.pem
    #openssl req \
    #    -x509 -new -subj '/' -days 7 \
    #    -key $KEY_NAME.pk8.pem \
    #    -out $KEY_NAME.x509.pem \
}

function ls_cert() {
    openssl x509 -noout -text \
        -in $KEY_NAME.x509.pem
}

function ls_cert_fingerprint() {
    openssl x509 -noout -sha1 -fingerprint \
        -in $KEY_NAME.x509.pem
}

# certificate --> pub.x509
function mv_cert_x509() {
    openssl x509 -noout -pubkey \
        -in $KEY_NAME.x509.pem \
        >$KEY_NAME.pub.x509.pem
}

function certificateToHex() {
    for i in *.x509.pem; do
        i=${i%%.*}
        openssl x509 -in $i.x509.pem -out $i.der -outform DER
        python bin2hex.py $i.der > $i.hex
        rm -f $i.der
    done
}

function keysToKeystore() {
    #for i in *.pk8; do
        #key=${i%%.*}
    for KEY_NAME in $@; do
        openssl pkcs8 \
            -in $KEY_NAME.pk8 -inform DER \
            -out $KEY_NAME.pk8.pem -outform PEM -nocrypt
        openssl pkcs12 -export \
            -in $KEY_NAME.x509.pem -inkey $KEY_NAME.pk8.pem \
            -out $KEY_NAME.p12 -passout pass:$KEY_PASS \
            -name $KEY_NAME
        rm -f $KEY_NAME.pk8.pem

        keytool -importkeystore \
            -alias $KEY_NAME \
            -srckeystore $KEY_NAME.p12 -srcstoretype pkcs12 \
            -srcstorepass $KEY_PASS \
            -destkeystore $STORE_NAME.jks -deststoretype jks \
            -deststorepass $STORE_PASS \
            -destkeypass $KEY_PASS
        rm -f $KEY_NAME.p12
    done
}

function keystoreToKeys() {
    for KEY_NAME in $@; do
        # get no way to pick up a single key pair from p12, although knowing the friendly name
        keytool -importkeystore \
            -alias $KEY_NAME \
            -srckeystore $STORE_NAME.jks -srcstoretype jks \
            -srcstorepass $STORE_PASS \
            -destkeystore $KEY_NAME.p12 -deststoretype pkcs12 \
            -deststorepass $KEY_PASS

        openssl pkcs12 \
            -in $KEY_NAME.p12 -passin pass:$KEY_PASS \
            -out $KEY_NAME.pem -nodes
        rm -f $KEY_NAME.p12

        openssl pkcs8 -topk8 \
            -in $KEY_NAME.pem -inform PEM -nocrypt \
            -out $KEY_NAME.pk8 -outform DER

        openssl x509 \
            -in $KEY_NAME.pem -inform PEM -passin pass: \
            -out $KEY_NAME.x509.pem

        rm -f $KEY_NAME.pem
    done
}

if test ! -v STORE_NAME || test -z "$STORE_NAME"; then
    STORE_NAME=ks
fi
if test ! -v STORE_PASS || test -z "$STORE_PASS"; then
    STORE_PASS=android
fi
if test ! -v KEY_NAME || test -z "$KEY_NAME"; then
    KEY_NAME=apk
fi
if test ! -v KEY_PASS || test -z "$KEY_PASS"; then
    KEY_PASS=android
fi

$1
