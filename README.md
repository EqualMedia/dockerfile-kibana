# Dockerfile for kibana 3.x

Built images are hosted at https://registry.hub.docker.com/u/state/kibana/

This image includes nginx which serves kibana code and proxies requests to
Elasticsearch at `/elasticsearch` location. This is a very convenient way to
reach Elasticsearch which may not be reachable by your browser directly.

## Configuration
Configuration is done via environment variables.

- `KIBANA_ES_HOST` - elasticsearch host/ip, default: `localhost`
- `KIBANA_ES_PORT` - elasticsearch port, default: `9200`

## Running

```bash
$ docker run -P -e KIBANA_ES_HOST=es.example.com -e KIBANA_ES_PORT=9210 state/kibana 
```
