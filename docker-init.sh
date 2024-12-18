# Ejecutar Docker Compose desde la carpeta sincronizada
docker-compose -f /vagrant_data/docker-compose.yml up -d

# Cambiar los permisos del socket de Docker para que Jenkins pueda acceder a él
sudo chmod 666 /var/run/docker.sock

# Instalar Jenkins
echo "Jenkins está instalado y corriendo en el puerto 8080. Puede acceder a él usando la IP 192.168.100.3:8080."
echo "Para obtener la contraseña de administrador inicial, ejecute: docker exec vagrant_data_jenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword"