# Latest Ubuntu 18.04 image as of Fri May 8 03:57:47 UTC 2020
FROM ubuntu@sha256:3235326357dfb65f1781dbc4df3b834546d8bf914e82cce58e6e6b676e23ce8f

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y jq git wget curl rsync && \
    wget -qO wo wops.cc && \
    git config --global user.email "nobody@example.com" && \
    git config --global user.name "nobody" && \
    bash wo && \
    wo stack install --nginx --mysql --php74 && \
    rm wo

RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh; \
    bash nodesource_setup.sh && \
    apt install -y nodejs build-essential && rm -rf /var/lib/apt/lists/*

COPY *.sh /
RUN chmod +x /*.sh
ENTRYPOINT ["/entrypoint.sh"]
