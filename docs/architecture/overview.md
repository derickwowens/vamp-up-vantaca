# Architecture Overview

## Project Structure

```
vamp-up-vantaca/
├── .github/
│   └── workflows/
│       └── security.yml      # Security scanning pipeline
├── docs/                     # MkDocs documentation source
│   ├── index.md
│   ├── executive-summary.md
│   ├── security/
│   ├── architecture/
│   └── operations/
├── scripts/                  # Operational utilities
│   ├── kill-port.sh
│   ├── restart-server.sh
│   └── setup-env.sh
├── mkdocs.yml               # Documentation site config
├── README.md
└── .gitignore
```

## Design Principles

### 1. Security by Default

All code changes pass through automated security scanning before merge.

### 2. Documentation as Code

Documentation lives alongside code and is versioned together. Changes to architecture are documented in the same PR.

### 3. Operational Automation

Common tasks are scripted to ensure consistency and reduce human error.

### 4. Environment Parity

Development, staging, and production environments are as similar as possible.

## Technology Decisions

| Concern | Choice | Rationale |
|---------|--------|-----------|
| Documentation | MkDocs + Material | Fast, beautiful, Markdown-based |
| Security Scanning | Snyk + CodeQL | Industry-leading vulnerability detection |
| CI/CD | GitHub Actions | Native integration, no additional tooling |
| Version Control | Git | Industry standard |

## Future Architecture

As the application develops, this section will be updated with:

- Application architecture diagrams
- Data flow documentation
- API specifications
- Infrastructure as Code references
