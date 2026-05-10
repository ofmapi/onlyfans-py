# Security Policy

OFMAPI takes the security of our platform — and the data of our customers'
end users — seriously. This document describes how to report vulnerabilities
and what we commit to in return.

## Supported versions

The latest minor release of every published OFMAPI SDK receives security
patches. Older minor versions receive critical-severity patches for 90 days
after a new minor ships.

## Reporting a vulnerability

**Please do not open a public GitHub issue for security reports.**

Email **security@ofmapi.com** with:

- a description of the issue and its impact,
- steps to reproduce, ideally with a minimal proof-of-concept,
- the affected version(s), commit SHA or release tag,
- any preliminary patch suggestions you have.

## Our commitments

| Step | Target |
|---|---|
| Acknowledgement of receipt | within 1 business day |
| Initial triage + severity assessment | within 3 business days |
| Status update cadence | weekly until resolved |
| Patch released for critical issues | within 7 days of confirmation |
| Public CVE / advisory | coordinated with you, typically within 30 days of patch |

These targets are guidelines, not contractual commitments — but we treat them
seriously and have an internal escalation path when they slip.

## Safe harbor

Good-faith security research conducted in line with this policy is welcome.
We will not pursue legal action against researchers who:

- act in good faith and avoid privacy violations, data destruction, or service degradation;
- give us a reasonable opportunity to remediate before any public disclosure;
- do not exploit vulnerabilities beyond what is necessary to demonstrate the issue.

## Trust posture

OFMAPI is engineered with the security posture our customers' end users
deserve:

- AES-256-GCM encryption for credentials at rest, with HSM-backed envelope keys
- Strict secrets boundary — credentials never logged, displayed, or returned by any API
- Bank-grade account safety architecture — dedicated residential IP per connected
  account, geo-locked to original sign-up region
- Stripe-style HMAC-SHA256 signed webhooks with replay-window protection and
  dual-secret rotation
- SOC 2 Type II preparation underway

Full posture and DPA available at **[ofmapi.com/security](https://ofmapi.com/security)**.
