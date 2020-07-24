FROM node:latest

LABEL "repository"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "homepage"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "maintainer"="blockmatic.io"

WORKDIR /github/workspace

RUN apt update && apt install -y build-essential

# Install cmake 3.18.0
RUN wget https://github.com/Kitware/CMake/releases/download/v3.18.0/cmake-3.18.0.tar.gz
RUN tar -zxvf cmake-3.18.0.tar.gz && cd cmake-3.18.0 && ./bootstrap && make && make install

# Install EOSIO.CDT
RUN wget https://github.com/eosio/eosio.cdt/releases/download/v1.7.0/eosio.cdt_1.7.0-1-ubuntu-18.04_amd64.deb
RUN apt install -y ./eosio.cdt_1.7.0-1-ubuntu-18.04_amd64.deb

# Install Hydra
RUN npm i -g jest @klevoya/hydra

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
