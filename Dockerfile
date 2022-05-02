#FROM node:16
#FROM node:10-alpine
#FROM nodejs:16
FROM ubi8/nodejs-16

# Create app directory
#WORKDIR /usr/src/app
#WORKDIR /opt/app-root/src

#RUN mkdir -p ./node_modules
#RUN chmod 664 /opt/app-root/src

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
#COPY package.json ./

#COPY --chown=default:root package*.json .
RUN chmod 664 /opt/app-root/src/package*.json

RUN ls -la
RUN pwd
RUN whoami
RUN groups default


#RUN adduser node -G root


RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]