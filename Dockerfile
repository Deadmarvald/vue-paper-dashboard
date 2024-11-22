# Use the official Node.js image with version 14
FROM node:14

# Install necessary tools for building dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev build-essential g++ make && apt-get clean

# Copy only package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Build the VueJS application
RUN npm run build

# Expose the port your app runs on
EXPOSE 80

# Command to run your VueJS application using Nginx
CMD ["npx", "http-server", "dist", "-p", "80"]

