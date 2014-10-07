# Dockerfile for kibana

Built images are hosted at https://registry.hub.docker.com/u/state/kibana/

## Running

`ENTRYPOINT` is set to `bin/kibana`, so the below kibana command line arguments
are valid.

```bash
$ docker run -P state/kibana --help
The Kibana Backend is starting up... be patient
Usage: kibana <options>

    -e, --elasticsearch URI          Elasticsearch instance
    -c, --config PATH                Path to config file
    -p, --port PORT                  Kibana port
    -q, --quiet                      Turns off logging
    -H, --host HOST                  Kibana host
    -v, --version                    Display version
    -h, --help                       Display this screen
```

For example:
```bash
$ docker run -P state/kibana -e http://es-server01.example.com:9200/ -p 15601
```
