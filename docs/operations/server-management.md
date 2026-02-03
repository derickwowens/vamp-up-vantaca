# Server Management

## Overview

This project includes utility scripts for managing local development servers. These scripts help prevent port conflicts and enable quick server restarts.

## Available Scripts

| Script | Purpose |
|--------|---------|
| `scripts/kill-port.sh` | Kill process running on a specific port |
| `scripts/restart-server.sh` | Restart a development server |
| `scripts/setup-env.sh` | Initialize development environment |

## Port Allocation

To prevent conflicts, we use the following port allocation:

| Service | Port | Description |
|---------|------|-------------|
| Documentation (MkDocs) | 8000 | Local docs preview |
| Frontend Dev Server | 3000 | React/Next.js development |
| Backend API | 8080 | API server |
| Database | 5432 | PostgreSQL (if used) |

## Usage

### Kill a Process on a Port

```bash
./scripts/kill-port.sh 3000
```

This finds and kills any process using port 3000.

### Restart a Server

```bash
./scripts/restart-server.sh frontend
```

Supported targets: `frontend`, `backend`, `docs`

### Setup Environment

```bash
./scripts/setup-env.sh
```

Installs dependencies and prepares the development environment.

## Troubleshooting

### Port Already in Use

```bash
# Find what's using the port
lsof -i :3000

# Kill it
./scripts/kill-port.sh 3000
```

### Server Won't Start

1. Check if port is available
2. Verify dependencies are installed
3. Check environment variables
4. Review server logs
