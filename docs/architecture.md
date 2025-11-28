# Legeon Enterprise Gateway – Architecture
# Legeon Enterprise Gateway – Architecture

## 1. Purpose

The **Legeon Enterprise Gateway** is the **enterprise-facing access point** into the LEGEON network.

It provides:

- A secure portal for **SAP AI consulting demand**  
- Workflows for **requisitions, shortlists, SoW, milestones, and invoices**  
- Integration hooks to **SAP Ariba, Fieldglass, and S/4HANA**  
- A clear boundary between **enterprise systems**, **Legeon Core Platform**, **Midnight Privacy Core**, and the **Genesis CompactDApp**

The Gateway does **not** implement the Legeon Core logic itself; it orchestrates demand-side workflows and calls into external Legeon services.

---

## 2. Source → Verify → Fulfill (S2F) Workflow

At a high level, the Gateway implements the **S2F lifecycle** for enterprise demand:

1. **Source** – capture enterprise demand, normalize requisitions, fetch shortlists from the Legeon Core Platform.
2. **Verify** – attach proofs from CompactDApp profiles, apply policy and compliance rules, route for approvals.
3. **Fulfill** – finalize SoW, start assignments, track milestones and invoices, feed back delivery signals.

```mermaid
flowchart LR
  EUser((Enterprise\nStakeholder))
  GWUI[Gateway UI\n(web app)]
  GWAPI[Gateway Services API\nS2F orchestrator]
  Policy[Policy Engine\nrates, geo rules]
  SAP[SAP Systems\nAriba, Fieldglass, S4]
  Core[Legeon Core Platform\nmatching, contracts]
  Compact[Genesis CompactDApp\nProfile proofs]
  Midnight[Midnight Privacy Core\nVC and escrow]

  EUser -->|create demand\nor view status| GWUI
  GWUI -->|REST or GraphQL calls| GWAPI

  %% Source
  GWAPI -->|normalize requisition| Policy
  GWAPI -->|request shortlist| Core
  Core -->|ranked consultants\nplus metadata| GWAPI

  GWAPI -->|enriched shortlist| GWUI
  EUser -->|review shortlist\nrequest more info| GWUI

  %% Verify
  GWAPI -->|request profile proofs| Compact
  Compact -->|selective disclosure\nverifiable claims| GWAPI
  GWAPI -->|check rules| Policy
  Policy -->|compliance decision\nand flags| GWAPI

  %% Fulfill
  EUser -->|approve SoW and award| GWUI
  GWUI --> GWAPI
  GWAPI -->|create or update\nengagement| Core
  GWAPI -->|sync award and SoW\nwhere configured| SAP

  %% Runtime delivery
  SAP -->|timesheet and status\nwhere available| GWAPI
  GWAPI -->|milestone updates| Core
  GWAPI -->|proofs for payment\nand audit trail| Midnight


