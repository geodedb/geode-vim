# GAP Analysis

Last updated: 2026-01-30
Repository: geode-vim
Review scope: Full codebase security review including CI/CD, supply chain, and configuration
Reviewer: Adversarial security code review agent

## Summary

| Severity | Count | Open | Closed |
|----------|-------|------|--------|
| Critical | 0 | 0 | 0 |
| High     | 2 | 0 | 2 |
| Medium   | 6 | 0 | 6 |
| Low      | 8 | 0 | 8 |
| Info     | 3 | 0 | 3 |
| **Total** | **19** | **0** | **19** |

Top 5 risks (open):

- None. All items in this review are closed.

## Stack-ranked findings

| Rank | Severity | RiskScore | Finding | Component | CWE/OWASP | Evidence (file:line) | GitLab Issue | Fix Summary | Owner | SLA/Due | Status |
|------|----------|-----------|---------|-----------|-----------|----------------------|--------------|-------------|-------|---------|--------|
| 1 | High | 48 | Unpinned CI component references using @latest (confidence::confirmed) | CI/CD | CWE-829, A08:2021 | `.gitlab-ci.yml:5-25` | [#1](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/1) | Pinned to v1.0.0 | N/A | Closed | CLOSED |
| 2 | High | 32 | Gitleaks allowlist excluded .vim/.md (confidence::confirmed) | Secret Detection | CWE-798, A05:2021 | `.gitleaks.toml:10-18` | [#2](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/2) | Removed exclusions | N/A | Closed | CLOSED |
| 3 | Medium | 36 | SBOM scan allowed failure (confidence::confirmed) | CI/CD | CWE-1104, A06:2021 | `.gitlab-ci.yml:20-22` | [#3](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/3) | Removed allow_failure | N/A | Closed | CLOSED |
| 4 | Medium | 24 | Insecure temporary file creation in CI (confidence::confirmed) | CI/CD | CWE-377 | `.gitlab-ci.yml:76-217` | [#11](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/11) | Replaced predictable /tmp paths with mktemp per job | N/A | Closed | CLOSED |
| 5 | Medium | 24 | Shallow clone limits security scanning coverage (confidence::suspected) | CI/CD | CWE-693, A05:2021 | `.gitlab-ci.yml:60-62` | [#14](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/14) | Set GIT_DEPTH=0 to provide full history to scanners | N/A | Closed | CLOSED |
| 6 | Medium | 24 | Pre-commit check-yaml used --unsafe (confidence::confirmed) | Pre-commit | CWE-502, A08:2017 | `.pre-commit-config.yaml:16-17` | [#4](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/4) | Removed --unsafe | N/A | Closed | CLOSED |
| 7 | Medium | 24 | Docker images used :latest tags (confidence::confirmed) | CI/CD | CWE-829, A08:2021 | `.gitlab-ci.yml:67,120,141,206` | [#5](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/5) | Pinned to alpine:3.19 | N/A | Closed | CLOSED |
| 8 | Medium | 12 | Shell command injection risk via find output (confidence::confirmed) | CI/CD | CWE-78 | `.gitlab-ci.yml:81-93` | [#6](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/6) | Used find -print0 | N/A | Closed | CLOSED |
| 9 | Low | 16 | CI components pinned by mutable tag (confidence::confirmed) | CI/CD | CWE-829, A08:2021 | `.gitlab-ci.yml:5-25` | [#13](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/13) | Pinned components to immutable commit SHA | N/A | Closed | CLOSED |
| 10 | Low | 16 | Missing source for generated files (confidence::confirmed) | Supply Chain | CWE-1068 | `language_metadata.zig:1` | [#12](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/12) | Added generator source and CI structure check | N/A | Closed | CLOSED |
| 11 | Low | 16 | CI images pinned to mutable tags (digest pinning missing) (confidence::confirmed) | Supply Chain | CWE-829, A08:2021 | `.gitlab-ci.yml:67,120,141,206` | [#15](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/15) | Pinned Alpine images by digest | N/A | Closed | CLOSED |
| 12 | Low | 16 | Pre-commit xargs without null handling (confidence::confirmed) | Pre-commit | SC2038 | `.pre-commit-config.yaml:60-62` | [#7](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/7) | Added -z and -0 | N/A | Closed | CLOSED |
| 13 | Low | 16 | Gitleaks allowlist suppresses tests/testdata paths (confidence::confirmed) | Secret Detection | CWE-693, A05:2021 | `.gitleaks.toml:10-13` | [#17](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/17) | Removed broad allowlist and added validation check | N/A | Closed | CLOSED |
| 14 | Low | 16 | CI installs unpinned Alpine packages via apk (confidence::confirmed) | Supply Chain | CWE-829, A08:2021 | `.gitlab-ci.yml:69,144,177` | [#18](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/18) | Pinned apk package versions and validated | N/A | Closed | CLOSED |
| 15 | Low | 16 | Gitleaks allowlist excludes all *.log files (confidence::confirmed) | Secret Detection | CWE-693, A05:2021 | `.gitleaks.toml:10-13` | [#19](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/19) | Removed broad *.log allowlist and added CI validation | N/A | Closed | CLOSED |
| 16 | Low | 8 | Pre-commit hooks pinned to tags (confidence::confirmed) | Supply Chain | CWE-829, A08:2021 | `.pre-commit-config.yaml:8-50` | [#16](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/16) | Pinned hooks to immutable SHAs | N/A | Closed | CLOSED |
| 17 | Info | 8 | CODEOWNERS missing pre-commit review rule (confidence::confirmed) | Governance | - | `CODEOWNERS:8-12` | [#8](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/8) | Added CODEOWNERS entry | N/A | Closed | CLOSED |
| 18 | Info | 4 | Documentation contained insecure HTTP URLs (confidence::confirmed) | Documentation | OWASP Transport | `CONTRIBUTING.md:105-109` | [#9](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/9) | Updated to HTTPS | N/A | Closed | CLOSED |
| 19 | Info | 4 | CI pipeline lacked fork MR protection rules (confidence::confirmed) | CI/CD | CWE-863 | `.gitlab-ci.yml:33-44` | [#10](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/10) | Added workflow rules | N/A | Closed | CLOSED |

## Findings by area

### App

- None found in this review.

### API

- None found in this review.

### Auth

- None found in this review.

### Data

- None found in this review.

### CI-CD

- [#1](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/1), [#3](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/3), [#5](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/5), [#6](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/6), [#10](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/10), [#11](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/11), [#13](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/13), [#14](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/14), [#15](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/15), [#17](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/17), [#18](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/18)

### IaC

- None found in this review.

### Container

- [#15](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/15)

### Ops

- [#8](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/8), [#9](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/9), [#12](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/12), [#16](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/16), [#19](https://gitlab.com/devnw/codepros/geode/geode-vim/-/issues/19)

## Quick wins / Medium / Strategic

Quick wins:

- Completed: mktemp-based temp file handling in CI (#11).
- Completed: full-history clones for security scanning (#14).
- Completed: digest-pinned CI images (#15).
- Completed: immutable SHAs for pre-commit hooks (#16).
- Completed: narrow gitleaks allowlist for tests/testdata (#17).
- Completed: pinned apk package versions in CI jobs (#18).
- Completed: removed broad *.log allowlist in gitleaks (#19).

Medium:

- Completed: immutable SHA pinning for CI components (#13).
- Completed: committed generator source (`language_metadata.zig`) to the repo (#12).

Strategic:

- None beyond the items above for this repository.
