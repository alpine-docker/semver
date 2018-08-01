FROM node:alpine

ENV VERSION=5.5.0
RUN npm install -g semver@${VERSION}

CMD ["semver", "--help"]
