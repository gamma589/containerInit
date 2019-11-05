FROM node:9

WORKDIR /app

RUN npm install -g contentful-cli

COPY package.json .
RUN npm install

ENV PORT 3200

COPY . .
RUN chmod a+x /app/startup.sh

USER node

ENTRYPOINT ["/app/startup.sh"]