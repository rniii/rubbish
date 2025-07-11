#!/bin/sh
tmpdir="$(mktemp -d)"

trap 'rm -r "$tmpdir"' EXIT

rsync -lptRq "$(git ls-files)" "$tmpdir"

git diff --patch | {
  cd "$tmpdir" || exit
  git apply --allow-empty --reverse -
  exec "$@"
}
