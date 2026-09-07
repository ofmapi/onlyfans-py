# OnlyFans API for Python (OFMAPI)

Use the OFMAPI OnlyFans API from Python: fans and subscribers, messages and
PPV, posts and the vault, earnings and statistics, plus signed webhooks.
Generate a typed client from the OpenAPI 3.1 spec in about a minute, or
call the REST endpoints with `requests`.

**Status: official SDK planned, not yet published.** OFMAPI has not
released a Python package. The package named `onlyfans` on PyPI belongs to a
different project and is not an OFMAPI client, so do not `pip install
onlyfans` expecting one.

## Generate a typed OnlyFans API client

```bash
pip install openapi-python-client
openapi-python-client generate --url https://ofmapi.com/openapi.json --meta poetry
pip install -e ./ofmapi-client
```

```python
import os
from ofmapi_client import Client
from ofmapi_client.api.accounts import list_accounts_v1_accounts_get

client = Client(
    base_url="https://api.ofmapi.com",
    headers={"Authorization": f"Bearer {os.environ['OFMAPI_KEY']}"},
)
accounts = list_accounts_v1_accounts_get.sync(client=client)
```

Or run the script in this repository, which does the same thing:

```bash
./generate.sh
```

Full walkthrough, including async usage and sending a message:
https://ofmapi.com/docs/sdk/python

## Plain HTTP works just as well

```python
import os, requests

r = requests.get(
    "https://api.ofmapi.com/v1/accounts",
    headers={"Authorization": f"Bearer {os.environ['OFMAPI_KEY']}"},
)
print(r.json())
```

Get an API key at https://app.ofmapi.com/api-keys (free during the public
Beta, no card required), connect an OnlyFans account in the dashboard, and
the account appears in that list.

## What OFMAPI is

An independent, unofficial OnlyFans API for agencies and developers: typed
REST endpoints, signed webhooks, and a hosted MCP server (174 tools) for
Claude, ChatGPT, Cursor, and VS Code. There is no official OnlyFans
developer API.

- Website: https://ofmapi.com
- Documentation: https://ofmapi.com/docs
- Interactive API reference (no login): https://ofmapi.com/docs/api
- OpenAPI spec: https://ofmapi.com/openapi.json
- Code examples (FastAPI webhook receiver, send a message, export earnings): https://github.com/ofmapi/examples
- Status: https://ofmapi.com/status
- Contact and support: https://ofmapi.com/contact

## Roadmap

This repository will hold the official SDK source when it is published.
Watch the repository or the changelog at https://ofmapi.com/changelog.

## License

MIT. See [LICENSE](LICENSE).

---

OFMAPI is an independent organisation, not affiliated with OnlyFans.com or
Fenix International Limited. "OnlyFans" is a registered trademark of Fenix
International Limited.
