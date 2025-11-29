# Gateway UI

The Gateway UI is the enterprise-facing front end for the S2F (Source → Verify → Fulfill) workflows.

It will provide:

- A secure web interface for enterprise users
- Forms for requisition creation and editing
- Shortlist review, proof inspection, and award decisions
- Statement of Work (SoW) review and approval
- Clear guidance when rules or verification conditions fail

This UI does **not** expose Legeon Core or CompactDApp directly — all calls flow through the Gateway API layer for privacy and boundary control.

