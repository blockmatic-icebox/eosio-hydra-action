FROM node:latest

LABEL "repository"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "homepage"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "maintainer"="blockmatic.io"

WORKDIR /github/workspace

RUN npm i -g @klevoya/hydra

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
