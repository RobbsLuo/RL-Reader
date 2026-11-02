#!/usr/bin/env bash
# 由 public/icons/icon.svg 渲染出各尺寸 PNG，改 logo 后跑一次即可
set -euo pipefail

cd "$(dirname "$0")/.."

SRC="public/icons/icon.svg"

if ! command -v magick >/dev/null 2>&1; then
  echo "需要 ImageMagick（brew install imagemagick）" >&2
  exit 1
fi

for size in 16 32 48 128; do
  magick -background none -density 768 "$SRC" -resize "${size}x${size}" -strip -depth 8 "public/icons/icon-${size}.png"
  echo "public/icons/icon-${size}.png"
done
