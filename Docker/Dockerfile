FROM tomsontom/oracle-java8-mvn:latest
MAINTAINER eMoflon developers <contact@emoflon.org>

SHELL ["/bin/bash", "-c"] 

# Install utilities
RUN apt-get update && apt-get install --yes --no-install-recommends xvfb git

# Download Eclipse
ARG eclipseDownloadFile=/opt/eclipse.tar.gz

#ARG eclipseDownloadUrl=http://ftp.fau.de/eclipse/technology/epp/downloads/release/oxygen/1/eclipse-modeling-oxygen-1-linux-gtk-x86_64.tar.gz
ARG eclipseDownloadUrl=http://mirror.nbtelecom.com.br/eclipse/technology/epp/downloads/release/2018-12/R/eclipse-modeling-2018-12-R-linux-gtk-x86_64.tar.gz

RUN mkdir -p /opt/
RUN wget -O $eclipseDownloadFile -nv $eclipseDownloadUrl
RUN tar -C /opt -xzf $eclipseDownloadFile
ENV ECLIPSE_HOME=/opt/eclipse
RUN [ -d $ECLIPSE_HOME/plugins ] || exit 1

# The following plugin allows to import all Eclipse projects in a given directory
ARG importProjectsDownloadUrl=https://github.com/seeq12/eclipse-import-projects-plugin/raw/master/jar/com.seeq.eclipse.importprojects_1.4.0.jar
ARG importProjectsDownloadFile=${ECLIPSE_HOME}/plugins/com.seeq.eclipse.importprojects_1.4.0.jar
RUN wget -O $importProjectsDownloadFile -nv $importProjectsDownloadUrl

# The following prefetch Maven resources to speed up subsequent builds
RUN git clone https://github.com/eMoflon/emoflon-core.git

# Install emoflon-core to trigger resolution of dependencies
ARG allRepositories=https://hallvard.github.io/plantuml/,http://download.eclipse.org/releases/oxygen/,http://emoflon.org/emoflon-core-updatesite/stable/updatesite/,https://download.eclipse.org/modeling/tmf/xtext/updates/releases/
RUN $ECLIPSE_HOME/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository $allRepositories -installIU org.moflon.core.feature.feature.group

# Prefetch Maven dependencies
# RUN (cd emoflon-core; mvn clean install integration-test; exit 0)
