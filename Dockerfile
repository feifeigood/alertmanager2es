ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest
LABEL maintainer="baipengfeisw@163.com"

ARG ARCH="amd64"
ARG OS="linux"
COPY alertmanager2es_${OS}_${ARCH} /bin/alertmanager2es

RUN mkdir -p /alertmanager2es

EXPOSE  9097
WORKDIR /alertmanager2es
ENTRYPOINT [ "/bin/alertmanager2es" ]
CMD [ "" ]