#!/bin/sh

while true; do
  case "$1" in
    "-A"|"--askpass") ;;
    "-B"|"--bell") ;;
    "-b"|"--background") ;;
    "-H"|"--set-home") ;;
    "-K"|"--remove-timestamp") ;;
    "-k"|"--reset-timestamp") ;;
    "-N"|"--no-update") ;;
    "-n"|"--non-interactive") ;;
    "-P"|"--preserve-groups") ;;
    "-p"|"--prompt") ;;
    "-S"|"--stdin") ;;
    "-s"|"--shell") ;;
    *) break ;;
  esac

  shift
done

run0 "$@"
