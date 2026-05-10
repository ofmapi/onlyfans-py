<div align="center">

# OnlyFans API · Python SDK

### The official Python SDK for [OFMAPI](https://ofmapi.com) — the OnlyFans API for chatbots, CRMs, agencies, and AI agents.

[![PyPI version](https://img.shields.io/pypi/v/onlyfans?style=flat-square&color=00aff0&label=onlyfans)](https://pypi.org/project/onlyfans/)
[![Python](https://img.shields.io/pypi/pyversions/onlyfans?style=flat-square&color=00aff0)](https://pypi.org/project/onlyfans/)
[![License: MIT](https://img.shields.io/badge/License-MIT-00aff0?style=flat-square)](LICENSE)
[![Docs](https://img.shields.io/badge/Docs-docs.ofmapi.com-00aff0?style=flat-square)](https://docs.ofmapi.com/sdk/python)
[![Status](https://img.shields.io/badge/Status-status.ofmapi.com-22c55e?style=flat-square)](https://status.ofmapi.com)

</div>

---

> 🚧 **Preview release.** General availability launching shortly. [Sign up at ofmapi.com](https://ofmapi.com) to be notified the moment the package goes live on PyPI.

## Why OFMAPI for the OnlyFans API in Python

OFMAPI is the most reliable OnlyFans API platform for Python developers
building chatbots, CRMs, mass-messaging tools, AI agents, and analytics
dashboards. This SDK gives you a clean, async-first, fully type-hinted
client over the entire OnlyFans API surface — without ever touching
proxies, captcha, request signing, or WebSocket reconnection logic.

## Install

```bash
pip install onlyfans
```

Requires Python 3.10+.

## Quickstart — your first OnlyFans API call

```python
from onlyfans import Client

# Get an OnlyFans API key at https://ofmapi.com — free, no card required.
client = Client(api_key="ofmapi_...")

# 1. List the OnlyFans accounts you've connected
accounts = client.accounts.list()
for a in accounts:
    print(a.id, a.display_name, a.status)

# 2. Send a message through the OnlyFans API
client.messages.send(
    account_id="acct_xxxxxxxxxxxx",
    fan_id=12345,
    text="Hey! Thanks for subscribing 💖",
)

# 3. Subscribe to OnlyFans webhook events
client.webhooks.create(
    url="https://your-app.com/ofmapi-webhook",
    events=["messages.received", "tips.received", "subscriptions.new"],
)

# 4. Stream live OnlyFans events over WebSocket
async for event in client.realtime.stream():
    print(event.kind, event.payload)
```

## What this OnlyFans API SDK gives you

- **Type hints on every method, response, and webhook event** — first-class
  Pyright Strict / mypy support out of the box.
- **Async-first** (`AsyncClient`) and **sync** (`Client`) variants for
  whatever your stack prefers.
- **Built-in retry** with exponential backoff and jitter on transient errors.
- **Idempotency-key helper** — safe retries on every write endpoint.
- **Webhook signature verification** (`verify_signature`) — Stripe-style,
  with replay-window protection and dual-secret rotation handling.
- **Cursor-based pagination** as iterators
  (`for fan in client.fans.iter(): ...`).
- **Pluggable HTTP backend** — swap the default for your own without
  changing call sites.

## Full surface area

This SDK exposes every endpoint of the OFMAPI OnlyFans API:

- 💬 **Messaging** — chats, send/edit/delete, mass messaging, scheduled
  campaigns, queue, PPV, media attachments, GIFs
- 📝 **Posts & vault** — posts (CRUD + comment/like/bookmark), vault media
  with categories, story creation, polls
- 👥 **Fans & subscriptions** — list/filter/segment fans, subscription
  history, restrict/block, lists, bundles
- 💰 **Earnings & analytics** — transactions, payouts, chargebacks, profit
  history, period comparisons, top-percentage statistics
- 🌐 **Public profile data** — discovery API, search across millions of
  public OnlyFans creator profiles
- 🔗 **Smart Links & tracking** — server-side conversion tracking, Meta-Pixel
  feed, free-trial links
- 🔔 **Webhooks** — endpoint management, signing-secret rotation, replay
- 📡 **Realtime** — multiplexed WebSocket of every event from your accounts

## Authenticating with the OnlyFans API

```python
# 1. From environment
import os
client = Client(api_key=os.environ["OFMAPI_API_KEY"])

# 2. Direct
client = Client(api_key="ofmapi_FQ4D...")

# 3. With per-request idempotency
resp = client.messages.send(
    account_id="acct_...",
    fan_id=12345,
    text="hi",
    idempotency_key="msg-2026-05-01-greeting",
)
```

API keys are scoped, IP-allowlistable, and rotatable from the dashboard at
[app.ofmapi.com/api-keys](https://app.ofmapi.com/api-keys).

## Build the next generation of OnlyFans software

Use the OFMAPI Python SDK to build products in the spirit of:

- 🤖 **AI chat platforms** like Botly, Supercreator, Substy, ChatPersona
- 📊 **Creator CRMs** like Infloww, OnlyMonster, CreatorHero
- 📈 **Analytics & metrics tools** like FansMetric, FansIQ
- 🎯 **Traffic & attribution platforms** like CreatorTraffic
- 🔗 **Link-in-bio + deeplink products** like Juicy Bio, Hello Butter
- 🧠 **AI agents** that operate connected creator accounts via Claude, ChatGPT, Cursor, or Manus
- 🛠️ **Agency back-offices** managing hundreds of accounts from a single dashboard

Whatever you're building, OFMAPI handles the OnlyFans plumbing — authentication,
real-time delivery, account safety, scale, and the continuous updates that
keep your integration working as the platform evolves — so you can ship
product, not infrastructure.

## Verifying OnlyFans webhook signatures

```python
from onlyfans import verify_signature, SignatureMismatch

@app.post("/ofmapi-webhook")
async def webhook(request: Request):
    body = await request.body()
    sig = request.headers["X-OFMAPI-Signature"]
    try:
        event = verify_signature(body, sig, secret="whsec_...")
    except SignatureMismatch:
        return Response(status_code=400)

    if event.kind == "messages.received":
        ...
```

The verifier handles timestamp tolerance (5 min default) and the 24h
dual-secret overlap window during rotation.

## Examples & recipes

End-to-end OnlyFans API recipes live in [`ofmapi/examples`](https://github.com/ofmapi/examples):

- Webhook server (FastAPI / Starlette / Flask)
- OnlyFans mass-message scheduler with progress events
- AI auto-reply chatbot (persona prompt + RAG over chat history)
- Earnings → analytics warehouse sync
- Reconciler / replay tool for missed-event recovery

## Documentation

- 📚 SDK reference + quickstart: **[docs.ofmapi.com/sdk/python](https://docs.ofmapi.com/sdk/python)**
- 📖 Endpoint catalog: **[docs.ofmapi.com/api](https://docs.ofmapi.com/api)**
- 🔔 Webhook event catalog: **[docs.ofmapi.com/webhooks](https://docs.ofmapi.com/webhooks)**

## Trust & safety

- 🔒 AES-256-GCM credential encryption with HSM-backed envelope keys
- 🛡️ Bank-grade account safety architecture — multi-layer defense engineered to keep accounts safe and online
- 🚫 Strict secrets boundary — credentials never logged or returned by any API
- 🛂 SOC 2 Type II preparation underway
- 🔐 Stripe-style HMAC-SHA256 signed webhooks with replay-window protection

Full security policy in [SECURITY.md](SECURITY.md) · vulnerability reports
to **[security@ofmapi.com](mailto:security@ofmapi.com)**.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Issues + PRs welcome.

## License

MIT — see [LICENSE](LICENSE).

---

<sub>OFMAPI is an independent organisation, not affiliated with OnlyFans.com or Fenix International Limited. "OnlyFans" is a registered trademark of Fenix International Limited.</sub>
