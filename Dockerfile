FROM ubuntu:18.04

LABEL "repository"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "homepage"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "maintainer"="blockmatic.io"

WORKDIR /github/workspace

RUN apt update && apt install -y build-essential cmake curl wget git

# Install Node.js
RUN curl --silent --location https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs

# Install EOSIO.CDT
RUN wget https://github.com/eosio/eosio.cdt/releases/download/v1.7.0/eosio.cdt_1.7.0-1-ubuntu-18.04_amd64.deb
RUN apt install -y ./eosio.cdt_1.7.0-1-ubuntu-18.04_amd64.deb

# Install Hydra
RUN npm i -g jest @klevoya/hydra

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
