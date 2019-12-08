#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ded423ad742e5001bfceb1f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ded423ad742e5001bfceb1f
curl -s -X POST https://api.stackbit.com/project/5ded423ad742e5001bfceb1f/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5ded423ad742e5001bfceb1f/webhook/build/publish > /dev/null
