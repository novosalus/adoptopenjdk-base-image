FROM ubuntu:focal

ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_REF

LABEL maintainer="Ritesh Chaudhari <ritesh@novosalus.com>" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$BUILD_VERSION \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vcs-url="https://github.com/novosalus/adoptopenjdk-base-image.git" \
      org.label-schema.name="novosalus/adoptopenjdk-base-image" \
      org.label-schema.vendor="Ritesh Chaudhari (Novosalus)" \
      org.label-schema.description="AdoptOpenJDK docker image" \
      org.label-schema.url="https://novosalus.com/" \
      org.label-schema.license="" \
      org.opencontainers.image.title="novosalus/adoptopenjdk-base-image" \
      org.opencontainers.image.description="AdoptOpenJDK docker image" \
      org.opencontainers.image.licenses="" \
      org.opencontainers.image.authors="Ritesh Chaudhari" \
      org.opencontainers.image.vendor="Ritesh Chaudhari" \
      org.opencontainers.image.url="https://hub.docker.com/r/novosalus/amc-adopt-open-jdk-base" \
      org.opencontainers.image.documentation="" \
      org.opencontainers.image.source="https://github.com/novosalus/adoptopenjdk-base-image.git"

ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

RUN apt-get -y update && apt-get -y install curl wget git unzip bash zip

WORKDIR /opt

# Downloading adoptopenjdk binary 
RUN wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u272-b10/OpenJDK8U-jdk_x64_linux_hotspot_8u272b10.tar.gz
RUN tar xzf OpenJDK8U-jdk_x64_linux_hotspot_8u272b10.tar.gz 

# Set Environment variables
ENV PATH=/opt/jdk8u272-b10/bin:${PATH}
ENV JAVA_HOME /opt/jdk8u272-b10

#cleanup 
RUN rm -f OpenJDK8U-jdk_x64_linux_hotspot_8u272b10.tar.gz

# smoke test
RUN java -version
