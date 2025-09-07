# Use Node.js LTS as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install git and other dependencies needed for building
RUN apk add --no-cache git

# Clone the repository
RUN git clone https://github.com/siteboon/claudecodeui.git .

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