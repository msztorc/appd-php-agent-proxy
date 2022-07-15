# appd-php-agent-proxy
Appdynamics PHP agent sidecar proxy


```bash
docker pull msztorc/appd-php-agent-proxy
```

Semantic versioning according to php-agent releases
```bash
docker pull msztorc/appd-php-agent-proxy:22.3.0
```
More docker images are available on DockerHub: https://hub.docker.com/r/msztorc/appd-php-agent-proxy/tags

---

#### Build

```bash
docker build -t appd-php-agent-proxy .
```

Building on a specific agent version

```bash
docker build --build-arg AGENT_VERSION=22.3.0.501 -t appd-php-agent-proxy .
```

#### Examples
