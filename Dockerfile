FROM node:18-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

COPY package*.json ./
RUN npm install
COPY . .

ARG API_URI
ENV API_URI=https://zaifin-eco.onrender.com/graphql/

EXPOSE 3000
CMD npm start -- --hostname 0.0.0.0
