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
RUN wget https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.16.1%2B1/OpenJDK11U-jdk_x64_linux_hotspot_11.0.16.1_1.tar.gz && \
tar xzf OpenJDK11U-jdk_x64_linux_hotspot_11.0.16.1_1.tar.gz && \
rm -f OpenJDK11U-jdk_x64_linux_hotspot_11.0.16.1_1.tar.gz

# Set Environment variables
ENV PATH=/opt/jdk-11.0.16.1+1/bin:${PATH}
ENV JAVA_HOME /opt/jdk-11.0.16.1+1

# smoke test
RUN java -version
