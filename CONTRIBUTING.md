# Contributing

Thanks for your interest in contributing to OFMAPI. This document covers what
we expect, how to set up a dev environment, and how to get a PR landed.

## Quick rules

- One change per PR. Small, focused PRs land quickly; mega-PRs sit for weeks.
- Add or update tests for any code change. We aim for >=80% coverage on new code.
- Run the linter + formatter before pushing. CI will enforce; your local run
  saves a round trip.
- Use [Conventional Commits](https://www.conventionalcommits.org/) for commit
  messages: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`, `perf:`.

## Development setup

Per-repository instructions are in `README.md`. The general flow is:

1. Fork the repo, create a feature branch off `main`.
2. Make your change. Keep diffs surgical.
3. Run the test suite locally.
4. Open a PR against `main` with a clear description and a "Closes #N" link
   if it resolves an issue.

## DCO

By contributing you certify the [Developer Certificate of Origin][dco] for
your contribution. Sign your commits with `git commit -s`.

[dco]: https://developercertificate.org/

## Need help?

- Open a Discussion on the repo
- Email **hello@ofmapi.com** for design questions
