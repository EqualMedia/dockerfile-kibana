FROM fedora:20

RUN yum update -y -q; yum clean all
RUN yum install -y -q nginx wget; yum clean all

ENV KIBANA_TARBALL_URL https://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.tar.gz
RUN wget -q ${KIBANA_TARBALL_URL} && tar -xzf $(basename ${KIBANA_TARBALL_URL}) &&\
  mv $(echo $(basename https://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.tar.gz) | sed "s/\.tar\.gz//")\
  /srv/kibana && rm -f $(basename ${KIBANA_TARBALL_URL})

ADD config.js /srv/kibana/config.js
ADD nginx.conf /etc/nginx/nginx.conf
ADD run.sh /srv/kibana/run.sh

WORKDIR /srv/kibana
EXPOSE 80

CMD ["/srv/kibana/run.sh"]
