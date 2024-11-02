FROM jenkins/jenkins:lts

USER root

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y curl

# Instalar Node.js directamente desde NodeSource (versión 18)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Verificar la instalación de Node.js, npm y npx
RUN node -v && npm -v && npx -v

# Instalar Docker
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

# Añadir el usuario Jenkins al grupo Docker
RUN usermod -aG docker jenkins

# Instalar Docker Compose Plugin
RUN apt-get update && \
    apt-get install -y docker-compose-plugin

# Verificar la versión de docker compose
RUN docker compose version

USER jenkins
