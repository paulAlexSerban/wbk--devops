FROM node:16

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && npm cache clean
# if you build you code for production
# RUN npm ci --ony=production

# Bundle app source
COPY . .

EXPOSE 8080

# define the command to run your app usng CMD
CMD ["node", "server.js"]