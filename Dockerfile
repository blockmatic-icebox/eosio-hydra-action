FROM node:14.5-alpine

LABEL "repository"="https://github.com/blockmatic/public-repo-template"
LABEL "homepage"="https://github.com/blockmatic/public-repo-template"
LABEL "maintainer"="blockmatic.io"

RUN yarn global add --ignore-optional @klevoya/hydra

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
