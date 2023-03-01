# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set working directory to /app
WORKDIR /usr/local/bin

# Install the Auth0 Deploy CLI globally
RUN npm install -g auth0-deploy-cli

# Set environment variables
ENV NODE_ENV production
ENV NODE_OPTIONS --max_old_space_size=4096

# Add support for running as a non-root user in Azure DevOps
RUN chown -R node:node /app
USER node

# Expose the port that the Auth0 Deploy CLI listens on
EXPOSE 3000

# Start the Auth0 Deploy CLI
CMD ["/usr/local/bin/auth0-deploy-cli"]

