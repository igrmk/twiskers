#!/usr/bin/env bash
set -euo pipefail

tmp="$(mktemp -d)"

for k in light dark
do
    cd "twiskers-$k"
    mac_icons="$tmp/mac.${k}.icons"
    mkdir "$mac_icons"
    mac_iconset="$tmp/mac.${k}.iconset"
    mkdir "$mac_iconset"
    for i in 16 32 64 128 256 512 1024
    do
        inkscape -h $i "twiskers-${k}.svg" --export-area=-18.3:-18.3:274.3:274.3 --export-filename "twiskers-${k}-${i}x${i}.png"
        inkscape -h $i "twiskers-${k}.svg" --export-area=-20:-20:276:276 --export-filename "$mac_icons/twiskers-${k}-${i}x${i}.png"
        exiftool -all= -overwrite_original_in_place twiskers-${k}-${i}x${i}.png
        exiftool -all= -overwrite_original_in_place "$mac_icons/twiskers-${k}-${i}x${i}.png"
    done

    for i in 16 32 128 256 512
    do
        cp "$mac_icons/twiskers-${k}-${i}x${i}.png" "$mac_iconset/icon_${i}x${i}.png"
        cp "$mac_icons/twiskers-${k}-$((i * 2))x$((i * 2)).png" "$mac_iconset/icon_${i}x${i}@2x.png"
    done
    iconutil --convert icns --output "twiskers-${k}.icns" "$mac_iconset"
    cd ..
done

rm -r "$tmp"
