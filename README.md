# Vamp Up Vantaca

## Security Scanning

This repository includes automated security scanning via GitHub Actions:

- **Snyk Dependencies** - Dependency vulnerability scanning
- **Snyk Code (SAST)** - Static application security testing
- **CodeQL Analysis** - GitHub's built-in code analysis
- **Dependency Review** - PR-time dependency checks

### Setup

1. Add `SNYK_TOKEN` to your repository secrets (Settings > Secrets > Actions)
2. Scans run automatically on push/PR to `main` and weekly on Sundays

### Results

Security findings appear in: **Repository > Security > Code scanning alerts**
