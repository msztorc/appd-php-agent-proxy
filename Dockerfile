FROM php:8.0.11-cli AS appd-proxy-installer

ARG AGENT_PATH=/opt/appdynamics/php-agent
ARG AGENT_VERSION=22.3.0.501

ARG AGENT_LOGS_PATH=/tmp/appd/logs/
ARG AGENT_CTRL_PATH=/tmp/appd/ctrl/

RUN apt-get update -y && \
    apt-get install -y bash curl bzip2 tar unzip

# download agent
RUN mkdir -p ${AGENT_PATH} && \
    cd ${AGENT_PATH} && \
    curl -OL https://download-files.appdynamics.com/download-file/php-tar/${AGENT_VERSION}/appdynamics-php-agent-x64-linux-${AGENT_VERSION}.tar.bz2 && \
    tar -xf ${AGENT_PATH}/appdynamics-php-agent-x64-linux-${AGENT_VERSION}.tar.bz2 -C ${AGENT_PATH} && \
    rm ${AGENT_PATH}/appdynamics-php-agent-x64-linux-${AGENT_VERSION}.tar.bz2


RUN mkdir -p ${AGENT_PATH}

# PHP Agent installation
# https://docs.appdynamics.com/appd/21.x/21.12/en/application-monitoring/install-app-server-agents/php-agent/install-the-php-agent/install-the-php-agent-by-shell-script

RUN chmod +x ${AGENT_PATH}/appdynamics-php-agent-linux_x64/install.sh
RUN ${AGENT_PATH}/appdynamics-php-agent-linux_x64/install.sh -a userAccount@accountKey controllerHost 8090 app tier node


FROM debian:bullseye-slim AS appd-php-agent-proxy

LABEL org.opencontainers.image.authors="Miroslaw Sztorc"

ARG AGENT_PATH=/opt/appdynamics/php-agent
ENV AGENT_PATH ${AGENT_PATH}

ARG AGENT_LOGS_PATH=/tmp/appd/logs/
ENV AGENT_LOGS_PATH ${AGENT_LOGS_PATH}

ARG AGENT_CTRL_PATH=/tmp/appd/ctrl/
ENV AGENT_CTRL_PATH ${AGENT_CTRL_PATH}

RUN mkdir -p ${AGENT_PATH}
COPY --from=0 ${AGENT_PATH}/ ${AGENT_PATH}/

WORKDIR ${AGENT_PATH}/appdynamics-php-agent-linux_x64/proxy/

CMD ./runProxy ${AGENT_CTRL_PATH} ${AGENT_LOGS_PATH}
