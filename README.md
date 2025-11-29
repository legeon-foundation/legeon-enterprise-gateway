# SAP Integrations

This module contains the optional integration hooks to SAP systems (Ariba, Fieldglass, and S/4HANA).

## Included in the S2F scope (Catalyst Fund 15)

- *Optional* Award sync  
  - EngagementId is sent to SAP to create or update a work order / equivalent
  - Only metadata is shared — no candidate PII

- *Optional* SoW sync  
  - A reference to the approved SoW (ID + URL) may be pushed into SAP
  - Source-of-truth for SoW stays in the Enterprise Gateway

## Out of scope for this proposal

Timesheets, milestones, and invoicing integrations will be handled in a future module.

