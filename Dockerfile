# Use the official Node.js image
FROM node:18

# Install Python and other necessary tools
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev build-essential && \
    ln -s /usr/bin/python3 /usr/bin/python

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

