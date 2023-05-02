FROM jenkins/jenkins:lts-jdk17

# No utilizar en un ambiente de producción
ENV JENKINS_USER=admin
ENV JENKINS_PASS=admin
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
###

ADD plugins.txt .
RUN jenkins-plugin-cli -f plugins.txt
ADD ssh-config .

USER root
# Instalación de Docker y sus dependencias
RUN apt-get update && \
    apt-get install -y apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg \
                       lsb-release && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
      "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    rm -rf /var/lib/apt/lists/*

# Dar permisos a Jenkins para ejecutar comandos de Docker sin necesidad de usar `sudo`
RUN usermod -aG docker jenkins

ADD start.sh .
RUN mkdir /deploy
RUN chown jenkins:jenkins /deploy

USER jenkins
ENTRYPOINT [ "/start.sh" ]
