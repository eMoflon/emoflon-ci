# Build me with
# docker build -t emoflon-ci .
#
# Deploy me with
# docker tag emoflon-ci emoflon/emoflon-ci
# docker login
# docker push emoflon/emoflon-ci
#
# Test procedure:
# docker run -i -t emoflon/emoflon-ci /bin/bash
# git clone https://github.com/eMoflon/emoflon-core.git && cd emoflon-core && mvn clean install
#
FROM tomsontom/oracle-java8-mvn:latest
MAINTAINER eMoflon developers <contact@emoflon.org>
# The following commands are there for prefetching Maven resources to speed up later builds
RUN apt-get update
RUN apt-get install --yes git
RUN git clone https://github.com/eMoflon/emoflon-core.git
RUN mvn -f emoflon-core/pom.xml clean install
