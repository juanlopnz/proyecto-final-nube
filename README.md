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
    vagrant ssh server
    ```

## Obtener la Clave de Acceso para Jenkins

Una vez que Jenkins esté en ejecución, necesitarás una clave para acceder a la interfaz de administración. Para obtener esta clave, ejecuta el siguiente comando en la terminal de la máquina virtual:

    
    docker exec -it <id_del_contenedor_jenkins> cat /var/jenkins_home/secrets/initialAdminPassword

Reemplaza `<id_del_contenedor_jenkins>` con el nombre de tu contenedor de Jenkins. Para obtener el id exacto del contenedor, puedes ejecutar:

    docker ps

Este comando te dará la clave inicial de acceso para Jenkins.

## Acceder a Jenkins en el Navegador

1. Abre tu navegador y navega a la siguiente dirección:

    ```
    http://192.168.100.3:8080
    ```

   Asegúrate de que el puerto 8080 esté accesible en tu configuración de Vagrant.

2. Introduce la clave de acceso que obtuviste en el paso anterior.

3. Debes instalar los plugins por defecto, como se muestra en la siguiente imagen.

![Instalación de plugins](images/install-plugins.png)

4. Puedes crear un nuevo usuario administrador o continuar con la cuenta inicial para explorar la interfaz de Jenkins y empezar a configurar tus pipelines, en este caso, se selecciona la opción de "Skip and continue as admin".

![Creación de usuario](images/create-user.png)

5. Por último, continúa con el paso hasta que tengas acceso a la interfaz de Jenkins.

## Desplegar y Ejecutar el Pipeline

Una vez dentro de Jenkins, puedes crear y ejecutar un pipeline para construir, probar y desplegar tu aplicación en el entorno Docker.

## Crear Trabajo
![Crear trabajo](images/create-job.png)
**Descripción:** Esta es la página principal de Jenkins, también conocida como el panel de control.

## Adicionar Configuraciones
![Agregar configuraciones](images/open-settings.png)
**Descripción:** Selecciona la opción "Administrar Jenkins". En esta sección, puedes agregar los plugins necesarios para los procesos de automatización, además de realizar otras configuraciones.

## Agregar Plugins
![Adicionar plugins](images/adicionar-plugin.png)
**Descripción:** En la opción de plugins, puedes gestionar los plugins que serán utilizados en la administración de Jenkins, así como en los procesos de despliegue o personalización de la plataforma.

## Plugin Coverage
![Agregar plugin](images/install-plugin.png)
**Descripción:** Aquí instalaremos el plugin "Coverage", el cual nos permite visualizar los resultados de nuestras pruebas con gráficos, facilitando la identificación de áreas de mejora. Una vez finalizada la instalación, regresaremos a la página principal.

## Crear Trabajo
![Crear trabajo](images/create-job.png)
**Descripción:** Selecciona la opción "Create a job" para comenzar a configurar un nuevo pipeline.

## Seleccionar Pipeline
![Seleccionar pipeline](images/select-pipeline.png)
**Descripción:** Esta imagen muestra la página de creación de un nuevo trabajo en Jenkins. Aquí, define el nombre del trabajo y selecciona la opción "Pipeline" como tipo de proyecto.

## Agregar Jenkinsfile
![Agregar Jenkinsfile](images/add-jenkinsfile.png)
**Descripción:** Esta sección muestra la configuración del pipeline, donde puedes definir los pasos que Jenkins seguirá. Aquí, pegaremos el script del `Jenkinsfile` presente en el repositorio del proyecto. Este archivo contiene las instrucciones y etapas del pipeline, desde la construcción hasta el despliegue.

## Iniciar Proceso
![Iniciar proceso](images/start-process.png)
**Descripción:** La imagen refleja el momento en que se inicia la ejecución del pipeline, seleccionando la opción "Construir ahora". Jenkins muestra el estado actual y el progreso de cada etapa definida en el `Jenkinsfile`.

## Ver Consola
![Ver consola](images/view-console.png)
**Descripción:** Esta captura muestra la salida de la consola de Jenkins durante la ejecución del pipeline. Aquí, los usuarios pueden revisar los logs, identificar errores y confirmar que cada paso se completa correctamente.

## Probar la Aplicación

1. Accede al contenedor con la imagen de Jenkins desde la terminal de la máquina virtual:

    ```bash
    docker exec -it vagrant_data_jenkins_1 /bin/bash
    ```

2. Verifica que los contenedores creados estén en ejecución:

    ```bash
    docker ps
    ```

3. Prueba la aplicación en Postman utilizando el endpoint `192.168.100.3:3001` de la siguiente manera:

   - **Método POST:**

     ![método post](images/test-post.png)

   - **Método GET:**

     ![método get](images/test-get.png)


## Detener el Entorno

Para apagar la máquina virtual de Vagrant y detener todos los contenedores de Docker, ejecuta:

    vagrant halt

---

¡Listo! Ahora tienes un entorno completo de Jenkins en Docker utilizando Vagrant.
