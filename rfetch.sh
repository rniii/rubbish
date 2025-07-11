#!/bin/sh

greppci() { lspci -d "::$1" -m | cut -d\" -f4,6 --output-delimiter=\ ; }

p() {
  func="$1"
  echo "$2" | while read -r line; do
    printf "  \e[36m%-10s \e[m %s\n" "$func" "$line"
    func=
  done
}

echo

p host     "$(cat /sys/devices/virtual/dmi/id/product_version)"
p kernel   "$(uname -sr)"
p graphics "$(greppci 0300)"
p firewire "$(greppci 0c00)"
p cpu      "$(sed -n 's/^model name\t: // p' /proc/cpuinfo | head -n1)"
p memory   "$(lscpu | sed -n '/cache:/p' | tr -s \ )"
p terminal "$TERM"
p shell    "$(basename "$SHELL")"
p wm       "$(cat "/proc/$(pgrep -P "$(pgrep xinit -n)" -n)/comm")"
p font     "it's Iosevka"

printf "\n  "

for color in $(seq 31 36); do
  printf "\e[%dm🞇 " "$color"
done

echo
echo
