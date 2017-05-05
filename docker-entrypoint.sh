#!/bin/bash

set -eo pipefail

# Environment variable and params (alphabetical order)
# AWS_ACCESS_KEY_ID = for aws user responsible for API calls.
# AWS_SECRET_ACCESS_KEY = for aws user responsible for API calls.
# ENDPOINT = AWS Address or DNS name for Elasticsearch service.
# VERBOSE = if set to --verbose will display detail log info

exec /usr/local/bin/aws-es-proxy -endpoint ${ENDPOINT} --listen 0.0.0.0:9200 ${VERBOSE}
return
