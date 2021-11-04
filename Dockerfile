#stage1
FROM node:14.17.3 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#stage2
FROM nginx:alpine
COPY --from=node /app/dist/Devops-App /usr/share/nginx/html