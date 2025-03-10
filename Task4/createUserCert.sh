#!/bin/bash

# Переменные
USER_NAME=$1
ORGANIZATION="sprint7"
GROUPS="system:authenticated"

# Создание приватного ключа
openssl genpkey -algorithm RSA -out ${USER_NAME}.key -aes256

# Создание CSR (Certificate Signing Request)
openssl req -new -key ${USER_NAME}.key -out ${USER_NAME}.csr -subj "/CN=${USER_NAME}/O=${ORGANIZATION}/OU=${GROUPS}"

# Подписание сертификата CA-сертификатом
openssl x509 -req -in ${USER_NAME}.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ${USER_NAME}.crt -days 365