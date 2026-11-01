# Publishing checklist

See README for the summary. Full rules:

1. Audio: strip generated original audio (`ffmpeg -an`), verify
   with ffprobe that no audio stream remains, then mix a fresh
   track (see `scripts/mix_music.sh`).
2. Trim: remove the first 2 seconds of every video before posting.
   Junction audit points shift accordingly (8s / 18s, not 10s / 20s).
3. Junction audit: check frames just before / after each junction.
   Stutter or jump (close-up suddenly pulling to full-body, or
   background / pose jumping because a segment was reused from a
   different tail) = discard that part, do not post it.
4. Duration rule: 20s passing = post 20s only; 10s passing = do not post.
5. Title / hashtags: adapt trending hooks for the same style;
   never publish a flat self-invented title.
6. Cover: AI-recommended, never the first; prefer 2nd, then 3rd.
7. Location: random from available options.
8. Platform music: select a matching hot track in the publish panel
   for traffic, in addition to the file's mixed audio.
9. SMS verification: click "get code" once, wait for the user's code,
   fill it, verify. Never fetch a code on your own, never re-click.
10. Data: record plays / likes / comments / shares / completion /
    bounce after review passes; do not claim a video is public
    while it is still under review, and do not invent data.
