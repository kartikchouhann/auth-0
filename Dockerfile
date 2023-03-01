FROM node:alpine

# Set necessary environment variables for Alpine in Azure DevOps
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV NODE_NO_WARNINGS=1

# Disable IPv6 in the container
RUN echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/99-disable-ipv6.conf

# Install Auth0 Deploy CLI
RUN npm install -g auth0-deploy-cli

# Set the working directory
WORKDIR /app

# Copy any necessary configuration files
COPY config.json /app

# Set the entry point
ENTRYPOINT ["auth0-deploy"]
