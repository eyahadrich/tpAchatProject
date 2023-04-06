FROM jenkins/jenkins:lts

USER root

       
RUN apt-get update && \
    apt-get install -y apt-transport-https \
       ca-certificates \
       curl \
       gnupg \
       lsb-release && \
    apt-get install -y openjdk-11-jdk && \
    apt-get install -y maven
        

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
ENV PATH=$JAVA_HOME/bin:$PATH

# Add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add Docker apt repository
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list

# Install Docker
RUN apt-get install -y docker.ce
#create docker group
RUN groupadd docker

# Allow Jenkins to access Docker
RUN usermod -aG docker jenkins

USER jenkins
