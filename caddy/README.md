# caddy

增加了cloudflare dns插件，可以使用cloudflare token直接获取证书。

```bash
docker pull ghcr.io/linuxhub-group/caddy:latest
```

## 目录

- Caddyfile: `/etc/caddy/Caddyfile`
- data: `/data`
- config: `/config`

## compose

```yml
version: "3.7"

services:
  caddy:
    image: caddy:<version>
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - $PWD/Caddyfile:/etc/caddy/Caddyfile
      - $PWD/site:/srv
      - caddy_data:/data
      - caddy_config:/config

volumes:
  caddy_data:
    external: true
  caddy_config:
#   Defining the data volume as external makes sure docker-compose down does not delete the volume. You may need to create it manually using docker volume create [project-name]_caddy_data.
```

参见：

- <https://github.com/caddy-dns/cloudflare>
- <https://hub.docker.com/_/caddy>
