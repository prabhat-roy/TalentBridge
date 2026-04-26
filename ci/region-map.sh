#!/usr/bin/env bash
# Map (cloud, residency-region) -> cloud-native region.
set -euo pipefail
CLOUD="$1"  REGION="$2"
case "$CLOUD/$REGION" in
  aws/eu)   echo eu-west-1 ;;
  aws/in)   echo ap-south-1 ;;
  aws/us)   echo us-east-1 ;;
  gcp/eu)   echo europe-west4 ;;
  gcp/in)   echo asia-south1 ;;
  gcp/us)   echo us-east4 ;;
  azure/eu) echo westeurope ;;
  azure/in) echo centralindia ;;
  azure/us) echo eastus ;;
  *) echo "unknown $CLOUD/$REGION" >&2 ; exit 1 ;;
esac
