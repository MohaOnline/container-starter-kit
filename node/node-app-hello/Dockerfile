# npm install 需要科学上网
# Start from a Node.js 12 (LTS) image
FROM node:12

# Specify the target directory inside the image in which all following commands will run
WORKDIR /content/node-app-hello

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all of the app files into the image
COPY . .

# 
EXPOSE 3000/tcp

# The default command to run when starting the container
CMD [ "npm", "start" ]
