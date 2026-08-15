#!/usr/bin/env bash
set -euo pipefail

forbidden='onboarding-supplied|owner-confirmed|availability-unverified|integration readiness|supported protocol contract|matching v[0-9]'

if rg -n -i --glob '*.mdx' "$forbidden" .; then
  echo "Public docs contain internal release language or a frozen dependency instruction." >&2
  exit 1
fi
