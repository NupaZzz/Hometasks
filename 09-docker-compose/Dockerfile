FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && apt-get install -y git make tar wget gcc
RUN wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV GOBIN="/go/bin"
USER jenkins 
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
RUN jenkins-plugin-cli --plugins authorize-project:latest workflow-aggregator:latest\
    antisamy-markup-formatter:latest build-timeout:latest cloudbees-folder:latest\
    configuration-as-code:latest credentials-binding:latest git:latest\
    github-branch-source:latest gradle:latest ldap:latest pipeline-github-lib:latest\
    pipeline-stage-view:latest ssh-slaves:latest timestamper:latest golang:latest\
    docker-workflow:latest
COPY ./casc.yaml /var/jenkins_home/casc.yaml