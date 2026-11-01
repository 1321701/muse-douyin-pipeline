#!/bin/bash
# Extract junction frames for a trimmed video.
# For a 30s video trimmed by 2s, junctions are at 8s and 18s.
# Usage: audit_frames.sh <video.mp4> [8 18]
set -euo pipefail
VIDEO="$1"; shift || true
for t in "$@"; do
  ffmpeg -y -v error -ss "$(python3 -c "print($t-0.1)")" -i "$VIDEO" -frames:v 1 "audit-${t%.*}-minus.png"
  ffmpeg -y -v error -ss "$(python3 -c "print($t+0.1)")" -i "$VIDEO" -frames:v 1 "audit-${t%.*}-plus.png"
done
