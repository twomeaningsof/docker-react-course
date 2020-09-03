FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#everything imporant will be stored in /app/build/

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
