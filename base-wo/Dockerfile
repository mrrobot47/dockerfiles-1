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
    apt install -y nodejs build-essential

# Install pupepeteer dependencies (https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md)
RUN apt install -y \
    build-essential \
    ca-certificates \
    fonts-liberation \
    gconf-service \
    libappindicator1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

COPY *.sh /
RUN chmod +x /*.sh
ENTRYPOINT ["/entrypoint.sh"]
