#!/bin/bash

set -eo pipefail

# Environment variable and params (alphabetical order)
# AWS_ACCESS_KEY_ID = for aws user responsible for API calls.
# AWS_SECRET_ACCESS_KEY = for aws user responsible for API calls.
# ENDPOINT = AWS Address or DNS name for Elasticsearch service.

exec /usr/local/bin/aws-es-proxy -endpoint ${ENDPOINT}
return
