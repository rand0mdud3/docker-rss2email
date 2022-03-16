Just a simple container to run rss2email.

```
  rss2email:
    container_name: rss2email
    image: rand0mdud3/rss2email
    environment:
      - TZ=US/PacificT
      - UPDATE_EVERY=10m
    volumes:
      - ./rss2email-config:/config
    restart: unless-stopped
```

https://github.com/rand0mdud3/docker-rss2email
