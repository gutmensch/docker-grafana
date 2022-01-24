ARG GRAFANA_VERSION=8.3.3

FROM grafana/grafana:$GRAFANA_VERSION

ARG GRAFANA_UID=2050
ARG GRAFANA_GID=2050

USER root

RUN addgroup -S -g $GRAFANA_GID grafana \
  && sh -c "find / -user grafana -exec chown ${GRAFANA_UID}:${GRAFANA_GID} {} \; || true" \
  && sed -ie "s%grafana:x:472:0:Linux User,,,:/home/grafana:/sbin/nologin%grafana:x:${GRAFANA_UID}:${GRAFANA_GID}:Linux User,,,:/home/grafana:/sbin/nologin%" /etc/passwd

USER $GRAFANA_UID
