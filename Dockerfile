#Stage 1
FROM node:18-alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

#Stage 2
FROM nginx:1.19.0
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/build .
ENTRYPOINT ["nginx", "-g", "daemon off;"]