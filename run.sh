#!/bin/bash

: ${KIBANA_ES_HOST:=localhost}
: ${KIBANA_ES_PORT:=9200}

sed -e "s|%kibana_es_host%|${KIBANA_ES_HOST}|" \
    -e "s|%kibana_es_port%|${KIBANA_ES_PORT}|" \
    -i /etc/nginx/nginx.conf

/usr/sbin/nginx
