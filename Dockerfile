FROM fedora:20

RUN yum update -y -q; yum clean all
RUN yum install -y -q wget java-1.7.0-openjdk-headless which log4j; yum clean all

RUN mkdir -p /srv

ENV KIBANA_TARBALL_URL https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA1.tar.gz
RUN wget -q ${KIBANA_TARBALL_URL} && tar -xzf $(basename ${KIBANA_TARBALL_URL}) &&\
  mv $(echo $(basename https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA1.tar.gz) | sed "s/\.tar\.gz//")\
  /srv/kibana && rm -f $(basename ${KIBANA_TARBALL_URL})

WORKDIR /srv/kibana
EXPOSE 5601

ENTRYPOINT ["/srv/kibana/bin/kibana"]
