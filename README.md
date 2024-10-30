# Proyecto de Integración Continua con Jenkins y Docker

Este proyecto configura un entorno de integración continua utilizando Jenkins en un contenedor Docker. A continuación, se muestran los pasos necesarios para iniciar el entorno con Vagrant, obtener la clave de acceso inicial de Jenkins y acceder a la interfaz de Jenkins en el navegador.

## Requisitos

- Vagrant
- VirtualBox
- Docker y Docker Compose (Vagrant se encargará de instalar estos en la máquina virtual)

## Iniciar el Entorno

1. Clona este repositorio en tu máquina local.

    ```bash
    git clone https://github.com/juanlopnz/proyecto-final-nube.git
    cd proyecto-final-nube
    ```

2. Inicia la máquina virtual de Vagrant.

    ```bash
    vagrant up
    ```

   Este comando descargará la imagen de la máquina virtual especificada en el `Vagrantfile` y configurará Docker y Docker Compose dentro de la máquina virtual.

3. Conéctate a la máquina virtual para ejecutar los comandos de Docker:

    ```bash
    vagrant ssh
    ```

## Obtener la Clave de Acceso para Jenkins

Una vez que Jenkins esté en ejecución, necesitarás una clave para acceder a la interfaz de administración. Para obtener esta clave, ejecuta el siguiente comando en la terminal de la máquina virtual:

    
    docker exec -it <nombre_del_contenedor_jenkins> cat /var/jenkins_home/secrets/initialAdminPassword

Reemplaza `<nombre_del_contenedor_jenkins>` con el nombre de tu contenedor de Jenkins. Para obtener el nombre exacto del contenedor, puedes ejecutar:

    docker ps

Este comando te dará la clave inicial de acceso para Jenkins.

## Acceder a Jenkins en el Navegador

1. Abre tu navegador y navega a la siguiente dirección:

    ```
    http://192.168.100.3/:8080
    ```

   Asegúrate de que el puerto 8080 esté accesible en tu configuración de Vagrant.

2. Introduce la clave de acceso que obtuviste en el paso anterior.

3. Sigue las instrucciones en pantalla para completar la configuración inicial de Jenkins.

4. Puedes crear un nuevo usuario administrador o continuar con la cuenta inicial para explorar la interfaz de Jenkins y empezar a configurar tus pipelines.

## Desplegar y Ejecutar el Pipeline

Una vez dentro de Jenkins, puedes crear y ejecutar un pipeline para construir, probar y desplegar tu aplicación en el entorno Docker.

## Detener el Entorno

Para apagar la máquina virtual de Vagrant y detener todos los contenedores de Docker, ejecuta:

    vagrant halt

---

¡Listo! Ahora tienes un entorno completo de Jenkins en Docker utilizando Vagrant.
