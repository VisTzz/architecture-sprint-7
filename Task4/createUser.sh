#!/bin/bash

# Переменные
USER_NAME=$1
KUBECONFIG_FILE=~/.kube/config

# Добавление пользователя в kubeconfig
kubectl config set-credentials ${USER_NAME} \
  --client-certificate=${USER_NAME}.crt \
  --client-key=${USER_NAME}.key \
  --embed-certs=true

# Добавление контекста для пользователя
kubectl config set-context ${USER_NAME}-context \
  --cluster=$(kubectl config current-context | cut -d'/' -f1) \
  --user=${USER_NAME}

echo "Пользователь ${USER_NAME} успешно добавлен в kubeconfig."