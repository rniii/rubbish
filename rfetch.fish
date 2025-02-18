#!/usr/bin/env fish

function greppci
  lspci -d ::$argv[1] -m | while read -at info
    echo "$info[3 4]"
  end
end

set host      (cat /sys/devices/virtual/dmi/id/product_version)
set kernel    (uname -sr)
set graphics  (greppci 0300)
set firewire  (greppci 0c00)
set cpu       (sed -n 's/^model name\t: // p' /proc/cpuinfo | head -n1)
set memory    (lscpu | sed -n '/cache:/p' | tr -s ' ')
set terminal  $TERM
set shell     (basename $SHELL)
set wm        (cat /proc/(pgrep -P (pgrep xinit -n) -n)/comm) # wayland isnt real
set font      "it's Iosevka"

set -a memory "DIMM0: Empty"

echo
for func in host kernel cpu graphics memory firewire terminal shell wm font
  for line in $$func
    printf "$(set_color cyan)  %-12s$(set_color normal) %s\n" $func $line
    set func ""
  end
end
echo

printf "  "
for color in $(seq 31 36)
  printf "\e[%dm🞇 " "$color"
end
echo
echo
