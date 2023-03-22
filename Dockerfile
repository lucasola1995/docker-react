FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#multistep process > copiamo in nginx solo 
#quello che ci serve, cioè il risultato di npm run build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#per run, dopo aver buildato il docker file docker run -p 8080:80 93691678ff37