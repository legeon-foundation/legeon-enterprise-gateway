# Legeon Enterprise Gateway — Architecture

The **Legeon Enterprise Gateway** is the enterprise-facing access point into the Legeon network.  
It enables organizations to create SAP AI consulting requisitions, review ranked shortlists, verify candidates, issue awards, and generate Statements of Work (SoWs) — all while preserving enterprise data privacy.

The Gateway orchestrates the **S2F (Source → Verify → Fulfill)** lifecycle and manages all interactions
between:

- Enterprise stakeholders (through the Gateway UI)
- Legeon Core Platform
- Policy and compliance services
- Genesis CompactDApp (proofs)
- Optional SAP systems (Ariba, Fieldglass, S4)

Timesheets, milestones, and invoicing flows are **out of scope for this Catalyst phase** and will be delivered later.

---

## 1. Purpose & Catalyst Scope

The Enterprise Gateway has a larger long-term scope, but the **Catalyst Fund 15** work focuses on delivering the S2F module:

### Included in Catalyst scope

- **Requisition intake** via Gateway UI  
- **Shortlist retrieval** from Legeon Core  
- **Verification** of candidates using CompactDApp proofs and Policy Engine  
- **Award creation** (EngagementId in Legeon Core)  
- **SoW generation and approval**  
- **Optional Award / SoW sync** to SAP systems  

### Explicitly out of scope for this phase

These belong to the *full* Gateway roadmap but are **not** delivered in Fund 15:

- Timesheet capture  
- Milestone execution/approval  
- Invoicing and payment orchestration  
- Detailed SAP timesheet/invoice integration  

This separation keeps the Catalyst-funded work realistic, auditable, and clearly defined.

---

## 2. High-Level Architecture

At a high level, the Enterprise Gateway consists of:

- **Gateway UI**  
  The web experience enterprise stakeholders use to:
  - Create and edit requisitions  
  - View shortlists  
  - Make award decisions  
  - Review and approve SoWs  

- **Gateway API (S2F Orchestrator)**  
  A backend service that:
  - Receives UI/API calls  
  - Normalizes requisitions and forwards them to Legeon Core  
  - Coordinates shortlist retrieval  
  - Requests proofs from CompactDApp  
  - Calls the Policy Engine for compliance checks  
  - Creates engagements and SoWs  
  - Optionally syncs Award/SoW references into SAP  

- **Legeon Core Platform**  
  Provides:
  - Matching and ranking of consultants  
  - Shortlist generation  
  - Engagement metadata (EngagementId, contract shell)  

- **Policy Engine**  
  Applies:
  - Rate rules  
  - Geo/compliance constraints  
  - Enterprise-specific policies for award decisions  

- **Genesis CompactDApp**  
  Provides:
  - Encrypted consultant proofs (skills, certifications, history)  
  - Selective disclosure / verifiable claims for the Verify step  

- **SAP Systems (optional)**  
  Used for enterprises that require:
  - Award / SoW references in Ariba, Fieldglass, or S4  

In this phase, SAP is treated as an **optional integration hook**, not a core dependency.

---

## 3. Architecture Diagram

```mermaid
graph LR
  UI[Gateway UI];
  API[Gateway API S2F];
  Core[Legeon Core];
  Policy[Policy Engine];
  Compact[Genesis CompactDApp];
  Midnight[Midnight Privacy];
  SAP[SAP Systems];

  UI --> API;
  API --> Core;
  API --> Policy;
  API --> Compact;
  API --> Midnight;
  API --> SAP;

  Core --> API;
  Policy --> API;
  Compact --> API;
  Midnight --> API;
  SAP --> API;



