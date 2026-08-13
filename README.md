# ThorNode documentation

Source for the ThorNode documentation site hosted with Mintlify.

## Local preview

Use Node.js 20.17 or newer, then run:

```bash
npx mint dev
```

Before opening a pull request or publishing:

```bash
npx mint validate
npx mint broken-links --check-anchors --check-redirects
npx mint a11y
```

## Source of truth

- Live product availability, locations, prices, limits, and route catalogs come from the authenticated dashboard and backend responses.
- The dashboard repository defines current customer flows.
- The production landing site defines public brand language.
- Never copy infrastructure secrets, raw internal addresses, customer identifiers, or deployment artifacts into this repository.

The pre-Mintlify GitBook source remains available in Git history, but it is intentionally absent from the current tree because it contains stale endpoints, prices, limits, and product claims. Do not restore those pages without revalidating them against the current product.
