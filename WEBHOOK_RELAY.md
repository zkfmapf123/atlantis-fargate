# Webhook Relay

## docker-compose.yml (Bucket Mode)

```sh
services:
  webhookrelay:
    image: webhookrelay/webhookrelayd:latest
    container_name: webhookrelay
    restart: unless-stopped
    network_mode: host  # localhost 접근 필수
    environment:
      - RELAY_KEY=${RELAY_KEY}
      - RELAY_SECRET=${RELAY_SECRET}
      - BUCKETS=test-bucket
```

## .env
```sh
    RELAY_KEY=
    RELAY_SECRET=
    BUCKETS=
```

## 참고

- <a href="https://webhookrelay.com/blog/using-drone-for-simple-selfhosted-ci-cd"> Webhook Relay Self hosted </a>