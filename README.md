# ThorNode documentation

Source for the ThorNode documentation site hosted with Mintlify.

## Writing system

Read [WRITING_GUIDE.md](./WRITING_GUIDE.md) before changing navigation or content. It defines the page types, tone, example requirements, product semantics, and pre-publish checks used across this repository.

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

## Content sources

- Tested service behavior and maintained API or protocol specifications define product behavior.
- Product locations, prices, limits, and route catalogs come from the authenticated dashboard.
- The dashboard repository defines current customer flows and exact UI labels.
- The documentation defines public developer terminology. Keep the landing site aligned with it.
- Never copy infrastructure secrets, raw internal addresses, customer identifiers, or deployment artifacts into this repository.

The pre-Mintlify GitBook source remains available in Git history, but it is intentionally absent from the current tree because it contains stale endpoints, prices, limits, and product claims. Do not restore those pages without revalidating them against the current product.
