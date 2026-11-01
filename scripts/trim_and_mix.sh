#!/bin/bash
# Trim first 2s, strip audio, then mix a fresh track.
# Usage: trim_and_mix.sh <noaudio-30s.mp4> <music.mp3> <out-withmusic.mp4> [keep_seconds]
set -euo pipefail
IN="$1"; MUSIC="$2"; OUT="$3"; KEEP="${4:-28}"
ffmpeg -y -v error -i "$IN" -ss 2 -t "$KEEP" -an -c:v copy tmp-trimmed.mp4
ffmpeg -y -v error -i tmp-trimmed.mp4 -i "$MUSIC" -map 0:v:0 -map 1:a:0 -t "$KEEP" -c:v copy -c:a aac -shortest "$OUT"
rm -f tmp-trimmed.mp4
ffprobe -v error -show_entries stream=codec_type -show_entries format=duration -of default=noprint_wrappers=1 "$OUT"
