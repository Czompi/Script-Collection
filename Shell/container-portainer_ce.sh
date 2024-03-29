#!/bin/sh

# Change default ports when using it in publicly available servers
docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 \
    --name=portainer --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /root/portainer_data:/data \
    cr.portainer.io/portainer/portainer-ce