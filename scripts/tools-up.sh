#!/usr/bin/env bash
# One-shot deploy of every OSS tool registered for TalentBridge via ArgoCD.
set -euo pipefail
argocd app sync -l "project=talentbridge-tools" --grpc-web
