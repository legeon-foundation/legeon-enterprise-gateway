#!/usr/bin/env bash
set -e

# Top-level docs
mkdir -p docs
cat << 'DOC' > docs/architecture.md
# Legeon Enterprise Gateway – Architecture

_Initial placeholder. To be filled with S2F flow and diagrams._
DOC

cat << 'DOC' > docs/api-overview.md
# API Overview

_TODO: Document public REST/GraphQL endpoints for the Gateway._
DOC

cat << 'DOC' > docs/sap-integration-design.md
# SAP Integration Design

_TODO: High-level design for Ariba, Fieldglass, and S/4HANA integration hooks._
DOC

cat << 'DOC' > docs/privacy-boundaries.md
# Privacy & Boundary Model

_TODO: Describe which data stays in the Gateway vs Legeon Core vs Midnight._
DOC

# Core folders with placeholders
mkdir -p gateway-ui/src gateway-ui/public
mkdir -p gateway-services/src/s2f-orchestrator \
         gateway-services/src/policy-engine \
         gateway-services/src/reporting-kpis \
         gateway-services/src/api \
         gateway-services/tests

mkdir -p integrations-sap/ariba-adapter/src \
         integrations-sap/ariba-adapter/tests \
         integrations-sap/fieldglass-adapter \
         integrations-sap/s4hana-adapter

mkdir -p adapters-core-ai/talent-graph-client \
         adapters-core-ai/opportunity-engine-client \
         adapters-core-ai/contract-service-client

mkdir -p adapters-privacy-core/vce-client \
         adapters-privacy-core/escrow-client \
         adapters-privacy-core/consent-registry-client

mkdir -p adapters-compactdapp/profile-proof-client \
         adapters-compactdapp/schema

mkdir -p config infra/docker infra/ci-cd

# Simple placeholder files to keep folders in git
for f in \
  gateway-ui/README.md \
  gateway-services/README.md \
  integrations-sap/README.md \
  adapters-core-ai/README.md \
  adapters-privacy-core/README.md \
  adapters-compactdapp/README.md \
  config/README.md \
  infra/README.md
do
  cat << 'PLH' > "$f"
# Placeholder

This file exists only to define the folder structure. Safe to replace when code is added.
PLH
done

# Example env file (no secrets)
cat << 'ENV' > config/env.example
# Example environment variables for the Legeon Enterprise Gateway
SAP_API_BASE_URL=https://example.sap.com
SAP_CLIENT_ID=your-client-id
SAP_CLIENT_SECRET=your-client-secret
LEGEON_CORE_API_URL=https://core.legeon.example
MIDNIGHT_VC_ENDPOINT=https://midnight-vc.example
ENV

echo "✅ Folder structure and placeholder docs created."
