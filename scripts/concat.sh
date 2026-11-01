#!/bin/bash
# Concat 10s segments in order. List segment files in concat.txt first.
# ffmpeg -y -v error -f concat -safe 0 -i concat.txt -c copy out-30s.mp4
set -euo pipefail
ffmpeg -y -v error -f concat -safe 0 -i "${1:-concat.txt}" -c copy "${2:-out-30s.mp4}"
