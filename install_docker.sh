#!/bin/bash

set -e

echo "======================================"
echo " Обновление списка пакетов"
echo "======================================"
sudo apt update

echo "======================================"
echo " Установка зависимостей"
echo "======================================"
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg

echo "======================================"
echo " Создание каталога для GPG ключей"
echo "======================================"
sudo install -m 0755 -d /etc/apt/keyrings

echo "======================================"
echo " Загрузка GPG ключа Docker"
echo "======================================"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "======================================"
echo " Подключение официального репозитория Docker"
echo "======================================"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo ${UBUNTU_CODENAME:-$VERSION_CODENAME}) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "======================================"
echo " Обновление списка пакетов"
echo "======================================"
sudo apt update

echo "======================================"
echo " Установка Docker Engine"
echo "======================================"
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "======================================"
echo " Добавление текущего пользователя в группу docker"
echo "======================================"
sudo usermod -aG docker $USER

echo "======================================"
echo " Включение автозапуска Docker"
echo "======================================"
sudo systemctl enable docker
sudo systemctl start docker

echo "======================================"
echo " Версии установленного ПО"
echo "======================================"
docker --version
docker compose version

echo "======================================"
echo " Установка завершена"
echo "======================================"
echo ""
echo "Перелогиньтесь по SSH или выполните:"
echo "newgrp docker"
echo ""
echo "Проверка:"
echo "docker run hello-world"
