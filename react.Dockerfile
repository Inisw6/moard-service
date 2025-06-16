FROM node:16-alpine

WORKDIR /app

RUN apk add --no-cache git

RUN git clone https://github.com/Inisw6/moard-model-admin-ui.git /app

RUN npm install

EXPOSE 3000

CMD ["npm", "start"] 