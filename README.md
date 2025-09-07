# ClaudeCodeUI Docker

A containerized version of [claudecodeui](https://github.com/siteboon/claudecodeui) - a web UI for Claude Code.

## Quick Start

### Using Podman

```bash
podman run -d \
  --name claudecodeui \
  -p 3001:3001 \
  -v ${HOME}/.claude.json:/root/.claude.json \
  -v ${HOME}/.claude/.credentials.json:/root/.claude/.credentials.json \
  -v ${HOME}/.claude/projects:/root/.claude/projects \
  -v ${HOME}/.claude/mcp_servers.json:/root/.claude/mcp_servers.json \
  -v ${HOME}/.claude/conversations:/root/.claude/conversations \
  -v ${HOME}/.claude/logs:/root/.claude/logs \
  -v ${HOME}/.claude/cache:/root/.claude/cache \
  --restart unless-stopped \
  nuhotetotniksvoboden/claudecodeui:latest
```

### Using Docker

```bash
docker run -d \
  --name claudecodeui \
  -p 3001:3001 \
  -v ${HOME}/.claude.json:/root/.claude.json \
  -v ${HOME}/.claude/.credentials.json:/root/.claude/.credentials.json \
  -v ${HOME}/.claude/projects:/root/.claude/projects \
  -v ${HOME}/.claude/mcp_servers.json:/root/.claude/mcp_servers.json \
  -v ${HOME}/.claude/conversations:/root/.claude/conversations \
  -v ${HOME}/.claude/logs:/root/.claude/logs \
  -v ${HOME}/.claude/cache:/root/.claude/cache \
  --restart unless-stopped \
  nuhotetotniksvoboden/claudecodeui:latest
```

### Using Docker Compose

Create a `docker-compose.yml` file (see example below) and run:

```bash
docker-compose up -d
```

## Volume Mounts

The container expects the following Claude configuration files and directories to be mounted:

- `~/.claude.json` - Main Claude configuration file
- `~/.claude/.credentials.json` - API credentials
- `~/.claude/projects` - Projects directory
- `~/.claude/mcp_servers.json` - MCP servers configuration
- `~/.claude/conversations` - Conversations history
- `~/.claude/logs` - Application logs
- `~/.claude/cache` - Application cache

## Environment Variables

- `PORT` - Port to run the application on (default: 3001)
- `NODE_ENV` - Node environment (default: production)

## Accessing the Application

Once running, the web UI will be available at `http://localhost:3001`

## Building from Source

```bash
git clone https://github.com/fspv/claudecodeui-docker.git
cd claudecodeui-docker
docker build -t claudecodeui .
```

## Docker Hub

Pre-built images are available on Docker Hub: `nuhotetotniksvoboden/claudecodeui`

## GitHub Actions

This repository includes a GitHub Actions workflow that automatically builds and pushes Docker images to Docker Hub when changes are pushed to the main branch.

To set up the workflow, add the following secrets to your repository:
- `DOCKERHUB_USERNAME` - Your Docker Hub username
- `DOCKERHUB_TOKEN` - Your Docker Hub access token