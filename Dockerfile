FROM node:latest

LABEL "repository"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "homepage"="https://github.com/blockmatic/eosio-hydra-action"
LABEL "maintainer"="blockmatic.io"

RUN npm i -g @klevoya/hydra

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
