# ClaudeCodeUI Docker

A containerized version of [claudecodeui](https://github.com/siteboon/claudecodeui) - a web UI for Claude Code.

## Quick Start

### Using Podman

```bash
podman run --replace \
  --name claudecodeui \
  -p 3001:3001 \
  -v ${HOME}/.claude.json:/root/.claude.json \
  -v ${HOME}/.claude/.credentials.json:/root/.claude/.credentials.json \
  -v ${HOME}/.claude/projects:/root/.claude/projects \
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

## Automated Builds

This repository automatically tracks both [claudecodeui](https://github.com/siteboon/claudecodeui) and [@anthropic-ai/claude-code](https://www.npmjs.com/package/@anthropic-ai/claude-code) releases and builds updated Docker images:

### Daily Automated Checks
- A GitHub Action runs daily at 6:00 UTC to check for new claudecodeui and Claude Code releases
- If a new release is detected, it automatically:
  - Updates version tracking files
  - Creates Git tags for the release
  - Triggers a Docker build with the new versions
- The system ensures you always have the latest stable versions available

### Manual Triggering
You can also manually trigger builds:
```bash
# Trigger build of latest release
gh workflow run build-and-push.yml

# Build specific version
gh workflow run build-and-push.yml --field claudecodeui_version=v1.8.0
```

### Git Tags and GitHub Releases
The automation creates multiple tags for better version tracking:
- `v1.8.0` - claudecodeui version tag
- `claude-v1.0.108` - Claude Code version tag  
- `v1.8.0-claude-v1.0.108` - Combined version tag

Each tag automatically creates a GitHub release with:
- Direct links to the corresponding Docker images
- Version information for both components
- Ready-to-use pull commands
- Quick start instructions

### Docker Tags
Docker images are tagged with:
- `latest` - Always points to the most recent build
- `v1.8.0` - claudecodeui version-specific tag
- `v1.8.0-claude-1.0.108` - Combined version tag showing both components

### Setup Requirements
To set up automated builds, add these repository secrets:
- `DOCKERHUB_USERNAME` - Your Docker Hub username
- `DOCKERHUB_TOKEN` - Your Docker Hub access token
