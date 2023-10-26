#stage1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install --legecy-peer-deps
RUN npm run build --prod

#stage2
FROM nginx:alpine
COPY --from=node /app/dist/summer-workshop-angular /usr/share/nginx/html
EXPOSE 80