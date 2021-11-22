FROM node:lts-alpine
WORKDIR /usr/src/app

ADD . ./
RUN npm install
EXPOSE 8888

CMD npm run serve