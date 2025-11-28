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

flowchart LR
  EUser((Enterprise Stakeholder))
  GWUI[Gateway UI (web app)]
  GWAPI[Gateway Services API (S2F orchestrator)]
  Policy[Policy Engine (rates, geo rules)]
  SAP[SAP Systems (Ariba, Fieldglass, S/4HANA)]
  Core[Legeon Core Platform (matching, contracts)]
  Compact[Genesis CompactDApp (Profile proofs)]
  Midnight[Midnight Privacy Core (VC & escrow)]

  EUser -->|create demand or view status| GWUI
  GWUI -->|REST or GraphQL calls| GWAPI

  %% Source
  GWAPI -->|normalize requisition| Policy
  GWAPI -->|request shortlist| Core
  Core -->|ranked consultants + metadata| GWAPI

  GWAPI -->|enriched shortlist| GWUI
  EUser -->|review shortlist or request info| GWUI

  %% Verify
  GWAPI -->|request profile proofs| Compact
  Compact -->|selective disclosure claims| GWAPI
  GWAPI -->|check rules| Policy
  Policy -->|compliance decision + flags| GWAPI

  %% Fulfill
  EUser -->|approve SoW and award| GWUI
  GWUI --> GWAPI
  GWAPI -->|create or update engagement| Core
  GWAPI -->|sync award + SoW| SAP

  %% Runtime delivery
  SAP -->|timesheet and status| GWAPI
  GWAPI -->|milestone updates| Core
  GWAPI -->|proofs for payment + audit trail| Midnight



