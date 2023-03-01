FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install -g auth0-cli && \
    npm install --production

# Copy the extension files to the container
COPY . .

# Set the command to deploy the extension using the Auth0 Deploy CLI
CMD ["auth0", "deploy", "--extension", "your-extension-name"]
