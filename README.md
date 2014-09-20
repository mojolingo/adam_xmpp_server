# adam_xmpp_server

ejabberd server version 14.07 based on [benlangfeld/docker-ejabberd](https://registry.hub.docker.com/u/benlangfeld/docker-ejabberd/). Extended with authentication against [Adam's Memory API](https://github.com/mojolingo/Adam.Snark.Rabbit/blob/master/memory/README.md#adam-memory).

## Usage

### Build

```
$ docker build -t <repo name> .
```

### Run in foreground

```
$ docker run -t -i -p 5222 -p 5269 -p 5280 mojolingo/adam_xmpp_server
```

### Run in background

```
$ docker run -d -i -p 5222:5222 -p 5269:5269 -p 5280:5280 mojolingo/adam_xmpp_server
```

### Run using fig

```yaml
xmpp:
  image: mojolingo/adam_xmpp_server
  environment:
    ERL_OPTIONS: "-noshell" # Avoid attaching a shell, which requires STDIN to be attached, which `fig up` does not do. See https://github.com/docker/fig/issues/480.
```

## Exposed ports

* 5222
* 5269
* 5280

## Runtime configuration

By default the container will serve the XMPP domain `localhost`. In order to serve a different domain at runtime, provide the `XMPP_DOMAIN` variable as such:

```
$ docker run -t -i -p 5222 -p 5269 -p 5280 -e "XMPP_DOMAIN=foo.com" mojolingo/adam_xmpp_server
```

The following runtime configuration available is:

* XMPP_DOMAIN - the XMPP domain to be served
* MEMORY_BASE_URL - the base URL of the Adam Memory API
* INTERNAL_USERNAME - the Memory API internal username for authentication requests
* INTERNAL_PASSWORD - the Memory API internal password for authentication requests

See the Memory API documentation for further details.
