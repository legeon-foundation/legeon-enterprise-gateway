# Configuration

The `config` directory contains environment-independent configuration templates for running the Gateway services.

Typical contents:

- `env.example` (template for environment variables)
- API endpoint configuration for:
  - Legeon Core
  - CompactDApp
  - Policy Engine
  - SAP systems (optional)
- Local environment configuration for developers

Sensitive values must **not** be committed to the repository.
