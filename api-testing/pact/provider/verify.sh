#!/usr/bin/env bash
set -euo pipefail
pact-provider-verifier https://pact-broker.talentbridge.internal \
  --provider talentbridge_identity_service \
  --provider-base-url http://identity-service.talentbridge.svc:50060 \
  --provider-version "${GIT_SHA:-local}" \
  --publish-verification-results
