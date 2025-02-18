complete -x -c git -n "__fish_use_subcommand" -a test -d "Run a command with commited changes only"
complete -x -c git -n "__fish_seen_subcommand_from test" -a "(complete -C '')"

complete -c spdx -a "(ls /usr/share/licenses/spdx | sed 's/.txt\$//')"
