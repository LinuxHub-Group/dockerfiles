# mihomo

get you subscribe here: <https://clash.coolrc.me>


```yml
services:
  mihomo:
    build:
      context: .
      dockerfile: Dockerfile
    network_mode: host
    restart: always
    pid: host
    ipc: host
    cap_add:
      - ALL
    security_opt:
      - apparmor=unconfined
    volumes:
      - ./data:/root/.config/mihomo/
      - /dev/net/tun:/dev/net/tun
      # 共享host的时间环境
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    environment:
      - DIRECT_DOMAIN=www.neofeed.org #your subscribe url domain
      - SUBSCRIBE="https://clash.coolrc.me/convert?url=<your subscribe>&rule=default"

```
