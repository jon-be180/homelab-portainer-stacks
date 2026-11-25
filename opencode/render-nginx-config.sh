#!/bin/sh
set -eu

encoded=$(printf 'opencode:%s' "$OPENCODE_PASSWORD" | base64 | tr -d '\n')
sed "s|__OPENCODE_BASIC_AUTH__|${encoded}|g" \
    /etc/nginx/opencode.conf.template \
    > /etc/nginx/conf.d/default.conf
