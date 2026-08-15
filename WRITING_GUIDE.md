# ThorNode writing guide

This guide keeps ThorNode developer documentation clear, consistent, and useful.

It adapts useful patterns from Helius, Corvus Labs, and OrbitFlare without copying their voice or forcing every product into the same template.

## What good looks like

Every page should help a developer make one decision or complete one task.

A developer should be able to tell, above the fold:

1. What the product or task does.
2. When to use it.
3. What they need before starting.
4. What successful completion looks like.

## Voice and tone

- Write to the developer as “you.”
- Use active verbs: create, copy, connect, send, receive, verify.
- Lead with the outcome, then explain the mechanism.
- Keep paragraphs to one idea and usually one to three sentences.
- Prefer protocol facts over adjectives.
- Use sentence case for headings.
- Define ThorNode-specific terms on first use.
- State limits and caveats as direct facts, not legalistic disclaimers.

Avoid unsupported claims such as “fastest,” “private,” “protected,” “zero-loss,” “enterprise-grade,” or “automatic routing.” A performance claim needs a reproducible benchmark with a date, region, measurement point, and percentile.

## Information architecture

Navigation follows developer jobs, not the internal org chart:

- Get started
- RPC and account data
- Data streams
- Raw shreds
- Transaction routes
- Dashboard
- Operate

Shared concepts such as credentials, locations, limits, and security have one main page. Product pages link to it instead of repeating the full explanation.

## Page types

### Landing page

The landing page answers “What are you building?” It routes by outcome before introducing product names.

Typical structure:

1. One-sentence platform promise.
2. Short first-call path.
3. Task-to-product chooser.
4. Next steps.

### Quickstart

A quickstart produces one observable result in about five minutes.

Typical structure:

1. Outcome sentence.
2. Prerequisites and where to get them.
3. Environment variables or placeholders.
4. Numbered happy path.
5. Complete runnable command or file.
6. Representative output.
7. A clear description of the working result.
8. Two to four next steps.

Keep one golden path. Put alternatives in tabs only when they are equally supported.

### Product overview

Cover the details a developer needs, in the order that best fits the product:

1. What it is.
2. The workloads it fits and the closest alternatives.
3. Input, output, transport, authentication, and result semantics.
4. A working first request, connection, or receiver.
5. Production behavior: limits, retry, reconnect, loss, ordering, or confirmation as applicable.
6. Product-specific troubleshooting.
7. Contextual next steps.

### API or protocol reference

Reference pages describe the working interface, not inferred behavior.

Include:

- Endpoint or interface.
- Authentication placement.
- Request fields with type, requirement, default, and allowed values.
- Response fields and representative output.
- Exact status or error semantics.
- Scope and enforcement of each limit.
- Retryability and recovery action.

Link upstream standards instead of duplicating them. Document only ThorNode's additions, restrictions, and deviations.

### Dashboard task

Describe the shortest UI path, then the resulting state. Use exact current UI labels in bold. Keep product concepts on their canonical product or reference page.

### Troubleshooting

Organize around the error or symptom a developer sees. Give the shortest useful fix and say whether retrying can help. Keep the full diagnostic matrix on the central troubleshooting page; small product pages usually need only `Problem | Fix`.

## Code examples

- Examples must run against the documented public interface.
- Never invent a hostname, SDK, schema version, route body, or response.
- Use secrets through environment variables.
- Shell variables: `$THORNODE_RPC_URL`, `$THORNODE_TOKEN`.
- JavaScript secrets: `process.env.THORNODE_RPC_URL`.
- Values the reader replaces: `<WALLET_ADDRESS>`.
- Include imports, dependencies, filename, and run command when a snippet is a full program.
- Put the expected output directly after the code.
- Start minimal; move retry, reconnect, and observability to the production section.

If a runnable example needs a specific client or schema, publish the exact version and required files. Do not replace missing integration details with internal coordination or release language.

## Product semantics

Keep these states distinct:

- **Raw:** protocol bytes or shreds before decoding.
- **Decoded:** a structured transaction derived from shreds.
- **Replayed:** captured data sent again from a rolling window.
- **Accepted:** a service accepted or forwarded a request.
- **Landed:** the transaction appeared on-chain.
- **Confirmed:** Solana reached the requested commitment.

Never use accepted, landed, and confirmed as synonyms.

## Credentials and dynamic data

- Explain a credential the first time the developer must use it.
- State its scope and exact placement: URL, metadata, control message, or dashboard registration.
- Link to Security for storage and rotation.
- Treat a complete credential-bearing URL as a secret.
- Do not publish live prices, locations, entitlements, or numeric limits unless they come from a maintained data source.
- For dynamic values, tell the developer exactly where the dashboard displays them.
- Tell the developer to select their pass or rental before copying product details.

## Callouts

- Use at most one warning on a normal page.
- Put a warning immediately next to the irreversible or security-sensitive action.
- Use notes for dynamic availability or naming differences.
- Prefer a plain sentence for routine limitations.
- Give callouts outcome-based titles when the component supports them.

## Links and next steps

- Link at the moment a developer needs the next concept.
- Link text describes the destination outcome; avoid “click here” and “see docs.”
- End each page with two to four contextual next steps.
- Keep old public slugs as direct redirects to the current canonical page.

## Pre-publish checks

Before publishing:

1. Compare product claims with the tested service, dashboard behavior, and maintained protocol specifications.
2. Parse and format every MDX file.
3. Run Mintlify validation, broken-link, anchor, redirect, and accessibility checks.
4. Run code syntax checks for runnable examples.
5. Scan changed content for secrets, customer identifiers, internal hosts, and raw IPs.
6. Preview desktop and mobile navigation.
7. Confirm canonical pages and legacy redirects on the deployed site.

## Reference systems

- Helius: https://www.helius.dev/docs
- Corvus Labs: https://docs.corvus-labs.io/platform
- OrbitFlare: https://docs.orbitflare.com/welcome
