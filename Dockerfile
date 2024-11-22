# Use the official Node.js image
FROM node:18

# Update system packages and install Python 2 along with Python 3
RUN apt-get update && apt-get install -y \
    python2 \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    && ln -s /usr/bin/python2 /usr/bin/python \
    && apt-get clean

# Install the latest node-gyp globally to resolve potential build issues
RUN npm install -g node-gyp@latest

# Set the working directory
WORKDIR /app

# Copy the application files into the container
COPY . .

# Install dependencies
RUN npm install

# Expose the port your app runs on
EXPOSE 80  

# Command to run your VueJS application
CMD ["npm", "run", "serve"]

