#multifile trexei panw apo 1 image
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#tsimpaei apo to parapanw kommati poy to onomasa as builder oti ftaxnei ston fakelo build
COPY --from=builder /app/build /usr/share/nginx/html


