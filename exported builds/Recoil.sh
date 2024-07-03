#!/bin/sh
echo -ne '\033c\033]0;Recoil\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Recoil.x86_64" "$@"
