#!/usr/bin/env fish
set tmpdir (mktemp -d)

function cleanup --on-event fish_exit
  rm -r $tmpdir
end

rsync -lptRq (git ls-files) $tmpdir

git diff --patch | begin
  cd $tmpdir
  git apply --allow-empty --reverse -
  $argv
end
