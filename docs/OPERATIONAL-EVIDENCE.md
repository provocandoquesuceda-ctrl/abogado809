# Abogado809 — Operational Evidence

## Cycle 1

- Control Plane: EDAA Portfolio Manager → Arquitecto Tecnológico → Operador Integral → Smoke Test
- Target: `abogado809`
- Scope: CI/CD hardening and first executable smoke test
- Smoke test: `scripts/smoke-test.mjs`
- Primary route: `/`

## Acceptance criteria

1. Dependencies install successfully.
2. `npm run build` succeeds.
3. Application starts successfully.
4. Smoke test returns HTTP 2xx for `/` with a non-empty response.
5. Production deployment is only considered operational after successful verification.

## Current blocker

The Vercel deployment workflow requires the repository secrets `VERCEL_TOKEN`, `VERCEL_ORG_ID`, and `VERCEL_PROJECT_ID`. These secrets cannot be created or exposed through source-code changes and must be configured in GitHub repository settings.

Until those secrets exist and a successful deployment run is observed, the project must not be marked `OPERATIONAL` or `PRODUCTION`.
