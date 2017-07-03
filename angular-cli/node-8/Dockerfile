FROM node:8

MAINTAINER Vadim Slizov <z7zmey@gmail.com>

USER node

RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN npm install -g @angular/cli

RUN npm cache clean --force