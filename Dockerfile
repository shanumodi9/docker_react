FROM node:alpine as shanu

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx

COPY --from=shanu /app/build /usr/share/nginx/html
