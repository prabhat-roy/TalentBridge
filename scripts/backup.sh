#!/usr/bin/env bash
set -euo pipefail
NS="${1:-talentbridge}"
TS=$(date -u +%Y%m%dT%H%M%S)
velero backup create "talentbridge-$TS" --include-namespaces "$NS" --wait
