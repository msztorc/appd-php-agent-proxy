[<img src="https://img.shields.io/badge/dockerhub-images-success.svg?logo=DOCKER">](<https://hub.docker.com/r/msztorc/appd-php-agent-proxy/tags>)

# appd-php-agent-proxy
Appdynamics PHP agent sidecar proxy


```bash
docker pull msztorc/appd-php-agent-proxy
```

Semantic versioning according to php-agent releases
```bash
docker pull msztorc/appd-php-agent-proxy:23.2.0
```
More docker images are available on DockerHub: https://hub.docker.com/r/msztorc/appd-php-agent-proxy/tags

---

### Build

```bash
docker build -t appd-php-agent-proxy .
```

Building on a specific agent version

```bash
docker build --build-arg AGENT_VERSION=22.3.0.501 -t appd-php-agent-proxy .
```


### Examples

- [sidecar-proxy-php-cli-1](https://github.com/msztorc/appd-php-agent-docker-examples/tree/master/sidecar-proxy-php-cli-1/README.md)  
Short-lived php-cli job container - uses prebuilt proxy image 

- [sidecar-proxy-php-cli-2](https://github.com/msztorc/appd-php-agent-docker-examples/tree/master/sidecar-proxy-php-cli-2/README.md)  
Short-lived php-cli job container - building own proxy image
