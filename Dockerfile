FROM node:13.13.0-alpine

WORKDIR /usr/src/app

RUN apk update

COPY package.json .
COPY yarn.lock .
RUN yarn install