# Use an official Node.js runtime as the base image with Node.js 16
FROM node:16

# Install npm 8 globally
RUN npm install -g npm@8

# Install Firebase CLI globally
RUN npm install -g firebase-tools

# Set the working directory in the container
WORKDIR /app

# Copy your application files into the container
COPY . .

# Install application dependencies in the root folder
RUN npm install

# Change the working directory to the 'functions' folder
WORKDIR /app/functions

# Install application dependencies in the 'functions' folder
RUN npm install

# Change the working directory back to the root folder
WORKDIR /app

# Expose the port your app listens on (if needed)
# EXPOSE 3000

# Define the startup command to start the project
CMD [ "npm run dev" ]
