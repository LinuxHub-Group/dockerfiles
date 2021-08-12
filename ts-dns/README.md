# ts-dns

DNS客户端

```bash
docker pull ghcr.io/linuxhub-group/ts-dns:latest
```

配置文件：`/root/ts-dns.toml`。具体配置参见：<https://github.com/wolf-joe/ts-dns>

## compose

使用`dockercompose`快速搭建doh：

```yml
version: '3'

services:
  dns:
    restart: always
    image: ghcr.io/linuxhub-group/ts-dns
    volumes:
      - ./config:/root/config
      - ./ts-dns.toml:/root/ts-dns.toml
    healthcheck:
      test: dig @127.0.0.1 -p 53 www.google.com || exit 1
      interval: 30s
      timeout: 2s
      retries: 5
  doh:
    restart: always
    image: satishweb/doh-server
    environment:
      DEBUG: "0"
      # Upstream DNS server: proto:host:port
      # We are using OpenDNS DNS servers as default,
      # Here is the list of addresses: https://use.opendns.com/
      UPSTREAM_DNS_SERVER: "udp:dns:53"
      DOH_HTTP_PREFIX: "/dns-query"
      DOH_SERVER_LISTEN: ":8053"
      DOH_SERVER_TIMEOUT: "5"
      DOH_SERVER_TRIES: "3"
      DOH_SERVER_VERBOSE: "false"
      # You can add more variables here or as docker secret and entrypoint
      # script will replace them inside doh-server.conf file
    #volumes:
    #  - ./doh-server.conf:/server/doh-server.conf
    healthcheck:
      #disable: true
      test: wget -O - 127.0.0.1:8053/dns-query?name=www.google.com&type=A || exit 1
      interval: 2m
      timeout: 3s
      retries: 3
    ports:
      - "443:8053"
```
