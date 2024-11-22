# Use the official Node.js image
FROM node:16

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
