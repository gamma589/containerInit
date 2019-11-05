FROM node:9

WORKDIR /app

RUN npm install -g contentful-cli

COPY package.json .
RUN npm install

ENV PORT 3200

COPY . .

USER node

ENTRYPOINT ["/bin/bash" "-c" "npm run start:dev --port ${PORT}"]