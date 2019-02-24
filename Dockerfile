FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm i terser@3.14.1
RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html