#!/bin/bash
set -e

SELFDIR=$(dirname "$0")
SELFDIR=$(cd "${SELFDIR}" && pwd)

# exec "$SELFDIR/lib/ruby/bin/ruby" "$SELFDIR/lib/app/cli.rb" "$@"
exec ruby "${SELFDIR}/../lib/cli.rb"
