#stage1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build --prod

#stage2
FROM nginx:alpine
COPY --from=node /app/dist/summer-workshop-angular /usr/share/nginx/html
EXPOSE 80