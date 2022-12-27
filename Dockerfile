FROM jenkins/jenkins:lts
USER root 

# install Docker Cleint 
RUN apt-get update -qq
RUN apt-get install software-properties-common -y
RUN apt-get install ca-certificates curl gnupg2 lsb-release apt-transport-https -y   
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add - 
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs)  \
    stable"
RUN apt-get update -qq
RUN apt-get install docker-ce -y
RUN usermod -aG docker jenkins