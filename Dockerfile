# Use Node.js LTS as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install git, curl, jq, python, make, and g++ for fetching latest release and building native modules
RUN apk add --no-cache git curl jq python3 make g++

# Get the latest release tag and clone that specific version
RUN LATEST_TAG=$(curl -s https://api.github.com/repos/siteboon/claudecodeui/releases/latest | jq -r '.tag_name') && \
    git clone --branch ${LATEST_TAG} --single-branch https://github.com/siteboon/claudecodeui.git .

# Install dependencies
RUN npm install

# Create directories for Claude configuration files
RUN mkdir -p /root/.claude

# Copy environment file if it exists
RUN if [ -f .env.example ]; then cp .env.example .env; fi

ARG PORT=3001
ENV PORT=${PORT}
ENV NODE_ENV=production

# Expose the port
EXPOSE ${PORT}

# Start the application
CMD ["npm", "run", "dev"]