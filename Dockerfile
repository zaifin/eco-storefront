FROM node:18-bullseye

# Install python2, make, g++ required for node-gyp to build node-sass native modules
RUN apt-get update && \
    apt-get install -y python2 build-essential && \
    # Create a symlink so python command points to python2 (node-gyp expects `python`)
    ln -sf /usr/bin/python2 /usr/bin/python && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ARG API_URI
ENV API_URI=https://zaifin-eco.onrender.com/graphql/

EXPOSE 3000

CMD ["npm", "start", "--", "--hostname", "0.0.0.0"]
