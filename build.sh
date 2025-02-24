#!/usr/bin/env bash
set -euo pipefail

tmp="$(mktemp -d)"

mac_icons="$tmp/mac.icons"
mkdir "$mac_icons"
mac_iconset="$tmp/mac.iconset"
mkdir "$mac_iconset"

xmlstarlet ed -u "/_:svg/@viewBox" -v "-18.3 -18.3 292.6 292.6" src/twiskers.svg > icon/twiskers.svg
xmlstarlet ed -u "/_:svg/@viewBox" -v "-18.3 -18.3 292.6 292.6" src/twiskers-cat.svg > bonus/twiskers-cat.svg

for i in 16 32 64 128 256 512 1024
do
    inkscape -h $i "src/twiskers.svg" --export-area=-18.3:-18.3:274.3:274.3 --export-filename "icon/twiskers-${i}x${i}.png"
    inkscape -h $i "src/twiskers.svg" --export-area=-20:-20:276:276 --export-filename "$mac_icons/twiskers-${i}x${i}.png"
    exiftool -all= -overwrite_original_in_place "icon/twiskers-${i}x${i}.png"
    exiftool -all= -overwrite_original_in_place "$mac_icons/twiskers-${i}x${i}.png"
done

for i in 16 32 128 256 512
do
    cp "$mac_icons/twiskers-${i}x${i}.png" "$mac_iconset/icon_${i}x${i}.png"
    cp "$mac_icons/twiskers-$((i * 2))x$((i * 2)).png" "$mac_iconset/icon_${i}x${i}@2x.png"
done

printf "%s\n" "Building macOS icons in $mac_iconset"..
iconutil --convert icns --output "icon/twiskers.icns" "$mac_iconset"

rm -r "$tmp"
