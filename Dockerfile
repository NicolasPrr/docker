FROM node:15.2.1-alpine3.10 as builder

WORKDIR '/app'
COPY package.json .
RUN npm install

COPY . .
RUN npm run build
RUN ls
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html                                     
