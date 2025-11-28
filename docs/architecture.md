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

```mermaidflowchart LR
    EUser[Enterprise stakeholder]
    GWUI[Gateway UI]
    EUser --> GWUI

