# Start from Node.js Alpine image
FROM node:alpine

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
      bash \
      curl \
      git \
      jq \
      openssl \
      openssh-client

# Set working directory
WORKDIR /app

# Install auth0 deploy-cli
RUN npm install -g auth0-deploy-cli

# Add environment variables for AzDO
ENV NODE_OPTIONS="--openssl-legacy-provider"

# Expose port if necessary
# EXPOSE 8080

# Default command to run when container starts
CMD ["auth0-deploy-cli", "--version"]
