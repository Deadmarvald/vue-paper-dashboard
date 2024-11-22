# Use the official Node.js image with version 14
FROM node:14

# Install necessary tools for building dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev build-essential g++ make && apt-get clean

# Set the working directory
WORKDIR /app

# Copy only package.json and package-lock.json for dependency installation
COPY package*.json ./

# Clean npm cache and install dependencies
RUN npm cache clean --force && npm install

# Copy the rest of the application files into the container
COPY . .

# Expose the port your app runs on
EXPOSE 8080  

# Command to run your VueJS application
CMD ["npm", "run", "serve"]

