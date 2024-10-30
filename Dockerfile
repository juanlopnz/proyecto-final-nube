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

USER jenkins