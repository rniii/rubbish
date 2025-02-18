#!/usr/bin/env fish
set -a options A/askpass B/bell b/background H/set-home K/remove-timestamp k/reset-timestamp
set -a options N/no-update n/non-interactive P/preserve-groups p/prompt S/stdin s/shell

argparse -is $options -- $argv
run0 $argv
