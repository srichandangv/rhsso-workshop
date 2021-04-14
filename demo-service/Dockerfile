FROM registry.access.redhat.com/rhoar-nodejs/nodejs-10

WORKDIR /usr/src/app

COPY package.json .

USER 1001

RUN chown -R $USER $WORKDIR

RUN npm install

COPY keycloak.json .
COPY app.js .

EXPOSE 8080

CMD [ "npm", "start" ]
