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
FROM airdock/oracle-jdk:1.8
MAINTAINER eMoflon developers (https://emoflong.github.io)
RUN apt-get --yes install maven git-core
# The following commands are there for prefetching Maven resources to speed up later builds
RUN git clone https://github.com/eMoflon/emoflon-core.git
RUN cd emoflon-core
RUN mvn clean install
