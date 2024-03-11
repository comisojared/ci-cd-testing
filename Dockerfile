#Stage 1
FROM node:18-alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]