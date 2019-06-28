FROM ubuntu:18.04

#jdk8
RUN apt-get -q update && \
    apt-get -y --no-install-recommends install curl git gnupg software-properties-common && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
    apt-add-repository "deb http://repos.azul.com/azure-only/zulu/apt stable main" && \
    apt-get -q update && \
    apt-get -y --no-install-recommends install zulu-8-azure-jdk=8.38.0.13 && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/zulu-8-azure-amd64

#maven
ARG MAVEN_VERSION=3.6.1
ARG USER_HOME_DIR="/root"
ARG SHA=b4880fb7a3d81edd190a029440cdf17f308621af68475a4fe976296e71ff4a4b546dd6d8a58aaafba334d309cc11e638c52808a4b0e818fc0fd544226d952544
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

#source
WORKDIR /opt
RUN git clone https://gitee.com/agile-bpm/agilebpm-base-spring-boot.git

#redis-cli mysql-client
RUN apt-get -q update && \
    apt-get -y --no-install-recommends install vim nodejs npm redis-server mysql-client && \
    rm -rf /var/lib/apt/lists/*

#
ENV LANG C.UTF-8

# WORKDIR /opt
# RUN git clone https://gitee.com/agile-bpm/agile-bpm-basic.git
# WORKDIR agile-bpm-basic/web
# RUN mvn clean install
# /opt/agile-bpm-basic/web/src/main/resources/properties/app-sit.properties
# /opt/agile-bpm-basic/web/src/main/resources/properties/app-dev.properties
#CMD mvn org.mortbay.jetty:maven-jetty-plugin:run

EXPOSE 8080

WORKDIR /opt/agilebpm-base-spring-boot/agilebpm-ui/src/main/resources/static/agilebpm-ui
RUN npm install
RUN npm run build

COPY application.yml /opt/agilebpm-base-spring-boot/agilebpm-spring-boot-samples/src/main/resources/application.yml
WORKDIR /opt/agilebpm-base-spring-boot
RUN mvn clean install

CMD java -jar agilebpm-spring-boot-samples/target/agilebpm-spring-boot-samples-1.2.1.jar
