# Use the official Node.js image with version 16
FROM node:16

# Install necessary tools for building dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev build-essential && apt-get clean

# Set the working directory
WORKDIR /app

# Copy only package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Expose the port your app runs on
EXPOSE 80  

# Command to run your VueJS application
CMD ["npm", "run", "serve"]

