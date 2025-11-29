# Legeon Enterprise Gateway – Delivery Roadmap

This roadmap outlines the planned implementation phases for the Catalyst-funded module of the
Legeon Enterprise Gateway. It aligns with the Source → Verify → Fulfill (S2F) lifecycle and focuses
strictly on the Catalyst-approved scope.

Future phases such as timesheets, milestones, and invoicing are intentionally excluded.

---

## ✅ Phase 0 — Foundations (Completed / In Progress)
**Goal:** Establish core structure and documentation  
**Deliverables:**
- Repository scaffold and documentation structure
- Architecture overview
- Sequence diagrams for S2F workflows
- Environment configuration templates
- Technical boundaries between Gateway, Core, CompactDApp, SAP, and Policy Engine

---

## 🚀 Phase 1 — Requisition Intake (Source)
**Goal:** Allow enterprise users or SAP-integrated systems to create requisitions
**Planned Deliverables:**
- Gateway UI form for requisition creation
- Gateway API endpoint: `POST /requisitions`
- Policy Engine rule validation (basic rule checks)
- Legeon Core integration: `CreateDemand(requisition)`
- Return normalized `DemandId` and status

**External Interactions:**
- Legeon Core (demand creation)
- Policy Engine (basic rule evaluation)

---

## 🚀 Phase 2 — Shortlist Retrieval (Source)
**Goal:** Fetch ranked candidate shortlists for an approved requisition  
**Planned Deliverables:**
- Gateway API retrieval endpoint: `GET /requisitions/{id}/shortlist`
- Legeon Core integration: `GetShortlist(DemandId)`
- Return shortlist enriched with CompactDApp profile metadata

**External Interactions:**
- Legeon Core (matching engine)

---

## 🚀 Phase 3 — Candidate Verification & Award (Verify)
**Goal:** Verify candidate proofs and apply policy rules before awarding  
**Planned Deliverables:**
- Verification workflow in Gateway API
- CompactDApp integration: `GetProofs(ProfileId)`
- Policy Engine evaluation: `VerifyRules(proofs, award)`
- Award endpoint: `POST /requisitions/{id}/award`
- Engagement creation in Legeon Core

**External Interactions:**
- CompactDApp (proofs + identity)
- Policy Engine (compliance rules)
- Legeon Core (engagement creation)

---

## 🚀 Phase 4 — Statement of Work (SoW) Creation (Fulfill)
**Goal:** Produce and approve an SoW associated with the engagement  
**Planned Deliverables:**
- SoW generation API: `POST /engagements/{id}/sow`
- SoW approval endpoint: `POST /engagements/{id}/sow/approve`
- Storage of SoW metadata and references

**External Interactions:**
- Legeon Core (engagement + SoW lifecycle)

---

## 🚀 Phase 5 — Optional SAP Sync (Fulfill)
**Goal:** Provide optional inbound/outbound integrations for enterprise systems  
**Planned Deliverables:**
- SAP sync for awarded engagements: `SyncAward(EngagementId)`
- SAP sync for SoW metadata
- Configurable toggle (on/off)

**External Interactions:**
- SAP Ariba
- SAP Fieldglass
- SAP S/4HANA

*(SAP sync is optional, not required for Catalyst scope execution.)*

---

## 📘 Future Phases (Post-Catalyst, Out of Scope)
Not included in the Catalyst proposal, but part of the full Enterprise Gateway vision:

- Milestone and timesheet submissions
- Invoice generation and validation
- Delivery confirmation workflows
- Full reporting dashboards

---

## 🧱 Guiding Principles
- **Boundary clarity:** Gateway orchestrates but does not replicate Legeon Core logic  
- **Least data retention:** Only minimal metadata stored in Gateway  
- **Extensibility:** Each integration module isolated for independent upgrades  
- **Enterprise security:** All external system interactions validated and audited  

---

## 📍 Status Summary
| Phase | Status | Notes |
|-------|--------|--------|
| Phase 0 – Foundations | 🟩 Completed | Documentation & repo ready |
| Phase 1 – Requisition Intake | 🟨 Planned | First functional sprint |
| Phase 2 – Shortlist Retrieval | 🟨 Planned | Depends on Legeon Core matching |
| Phase 3 – Verify & Award | 🟨 Planned | Uses CompactDApp proofs |
| Phase 4 – SoW Creation | 🟨 Planned | Builds engagement lifecycle |
| Phase 5 – SAP Sync | 🟨 Optional | Enterprise integration |

---

## ✔️ Summary
This roadmap reflects the deliverables funded by Catalyst and demonstrates a clear,
phased path from intake → verification → fulfillment, with optional enterprise
system integration. It also isolates out-of-scope features to avoid reviewer
confusion and keep expectations aligned.

