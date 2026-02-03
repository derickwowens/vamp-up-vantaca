# Scanning Pipeline

## Workflow Configuration

The security scanning pipeline is defined in `.github/workflows/security.yml`.

## Jobs

### 1. Snyk Dependencies

Scans `package.json` and `package-lock.json` for known vulnerabilities in dependencies.

```yaml
snyk-dependencies:
  name: Snyk Dependencies
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
    - run: npm ci
    - uses: snyk/actions/node@master
      with:
        command: test
```

**Output**: SARIF report uploaded to GitHub Security tab.

### 2. Snyk Code (SAST)

Static analysis of source code to find security vulnerabilities.

```yaml
snyk-code:
  name: Snyk Code (SAST)
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - uses: snyk/actions/node@master
      with:
        command: code test
```

**Detects**: SQL injection, XSS, path traversal, hardcoded secrets, and more.

### 3. CodeQL Analysis

GitHub's semantic code analysis engine.

```yaml
codeql:
  name: CodeQL Analysis
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - uses: github/codeql-action/init@v4
      with:
        languages: javascript-typescript
        queries: security-and-quality
    - uses: github/codeql-action/autobuild@v4
    - uses: github/codeql-action/analyze@v4
```

**Benefit**: Finds complex vulnerabilities that pattern-based scanners miss.

### 4. Dependency Review

Runs only on pull requests. Blocks PRs that introduce critical vulnerabilities.

```yaml
dependency-review:
  name: Dependency Review
  runs-on: ubuntu-latest
  if: github.event_name == 'pull_request'
  steps:
    - uses: actions/checkout@v4
    - uses: actions/dependency-review-action@v4
      with:
        fail-on-severity: critical
        deny-licenses: GPL-3.0, AGPL-3.0
```

## Required Secrets

| Secret | Purpose |
|--------|---------|
| `SNYK_TOKEN` | Authentication for Snyk API |

Add secrets at: **Repository > Settings > Secrets and variables > Actions**
