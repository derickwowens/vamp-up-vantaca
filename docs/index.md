# Vamp Up Vantaca

Welcome to the documentation for the Vantaca consulting engagement.

## Quick Links

| Section | Description |
|---------|-------------|
| [Executive Summary](executive-summary.md) | High-level overview for stakeholders |
| [Security Overview](security/overview.md) | Our security-first approach |
| [Architecture](architecture/overview.md) | System design and decisions |
| [Operations](operations/server-management.md) | Server and port management |

## Project Philosophy

This engagement follows enterprise-grade development practices:

- **Security First** - Vulnerability scanning before application code
- **Documentation Driven** - Decisions and architectures documented upfront
- **Operational Excellence** - Scripts and automation for consistent environments
- **Transparency** - Stakeholders have visibility via this documentation site

## Getting Started

### View Documentation Locally

```bash
# Install dependencies
pip install mkdocs mkdocs-material pymdown-extensions

# Serve locally
mkdocs serve
```

Documentation will be available at `http://localhost:8000`

### Build Static Site

```bash
mkdocs build
```

Output will be in the `site/` directory.
