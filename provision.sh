#!/bin/bash

# Actualizar repositorios y paquetes
sudo apt-get update
sudo apt-get upgrade -y

# Instalar Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker vagrant

# Instalar Docker Compose
sudo apt-get install -y docker-compose
