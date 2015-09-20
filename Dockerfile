FROM debian:latest
MAINTAINER WangYan <i@wangyan.org>

RUN apt-get update && \
  apt-get install -y python-pip && \
  pip install shadowsocks && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY docker-shadowsocks.sh /shadowsocks.sh
ENTRYPOINT ["/shadowsocks.sh"]

CMD ["ssserver","-c","/etc/shadowsocks.json"]
