FROM tomsontom/oracle-java8-mvn:latest
MAINTAINER eMoflon developers <contact@emoflon.org>

SHELL ["/bin/bash", "-c"] 

# Install utilities
RUN apt-get update && apt-get install --yes git

# Download Eclipse
RUN mkdir -p /opt/
ADD http://ftp.fau.de/eclipse/technology/epp/downloads/release/oxygen/1/eclipse-modeling-oxygen-1-linux-gtk-x86_64.tar.gz /opt
ENV ECLIPSE_HOME=/opt/eclipse
ls -la ${ECLIPSE_HOME}
RUN [ -d ${ECLIPSE_HOME}/plugins ] || exit 1 # Verify Eclipse home

ADD https://github.com/seeq12/eclipse-import-projects-plugin/raw/master/jar/com.seeq.eclipse.importprojects_1.4.0.jar ${ECLIPSE_HOME}/plugins/
RUN [ -f ${ECLIPSE_HOME}/plugins/com.seeq.eclipse.importprojects_1.4.0.jar ] || exit 1 # Verify correct location of import plugin

# The following prefetch Maven resources to speed up subsequent builds
RUN git clone https://github.com/eMoflon/emoflon-core.git

# Build projects with Eclipse to trigger code generation
# We create an Eclipse workspace rooted at ./emoflon-core, import all projects that can be found in the repo, and finally build all projects
ARG workspacePath=./emoflon-core
ARG repositoryRoot=./emoflon-core
ARG allRepositories=http://files.idi.ntnu.no/publish/plantuml/repository/,http://download.eclipse.org/releases/oxygen/,http://emoflon.org/updatesites/emoflon-core/updatesite/
RUN $ECLIPSE_HOME/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository $allRepositories -installIU org.moflon.core.feature.feature.group
#RUN $ECLIPSE_HOME/eclipse -nosplash -application org.eclipse.jdt.apt.core.aptBuild -data $workspacePath
#RUN $ECLIPSE_HOME/eclipse -nosplash -application com.seeq.eclipse.importprojects.headlessimport -data $workspacePath -import $repositoryRoot
#RUN $ECLIPSE_HOME/eclipse -nosplash -application org.eclipse.jdt.apt.core.aptBuild -data $workspacePath

# Invoke Tycho. Ignore failure. We just want to cache the dependencies
RUN (cd emoflon-core; mvn clean install; exit 0)
