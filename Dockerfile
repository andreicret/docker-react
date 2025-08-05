FROM node:24-alpine3.21 AS builder 

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# in run phase the /app/build is important to us, we want to copy that
# in the nginx container

FROM nginx:1.29.0

COPY --from=builder /app/build /usr/share/nginx/html











