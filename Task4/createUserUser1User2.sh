#!/bin/bash

./createUserCert.sh User1
./createUser.sh User1
echo "Пользователь User1 успешно добавлен в kubeconfig."

./createUserCert.sh User2
./createUser.sh User2
echo "Пользователь User2 успешно добавлен в kubeconfig."