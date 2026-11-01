# Muse Douyin AI Short-Video Pipeline

A fully automated, multi-lane production-and-publishing pipeline for
original AI-generated short dance / beauty videos.

> Originality rule, stated up front: study trends for style only
> (makeup, outfit silhouette, composition, lighting, dance rhythm).
> Do NOT re-upload, re-cut, or directly reuse another creator's
> footage, face, or cover as the final video. Every published video
> must be newly generated, must declare AI generation where the
> platform requires it, and must pass a junction / quality audit
> before posting. If a segment fails, discard it — never fake a
> full-length video by looping, and never retry a failed generation
> by renaming or pixel-tweaking the same request.

## What it does

```
research (trends, dance styles, music)
  -> image lane (original covers, face-anchored, single-person, vertical)
  -> video lane (10s segments, tail-frame chaining, parallel lanes)
  -> audit lane (junction frames, audio strip, 2s head trim)
  -> music lane (fresh track per video, mixed into the file)
  -> publish lane (title from trending hooks, hashtags, AI cover,
                    random location, platform music selected for traffic)
  -> data lane (plays, likes, completion, bounce; feed back into styles)
```

## Lanes run in parallel, with 3 checkpoints

1. Research dedup — no reused creators, frames, or tracks.
2. Covers audited + soft-focus applied — clear, unmosaicked face,
   simple background with at most one element.
3. Videos tail-frame checked (~30s target) — junction frames
   just before / after each seam must show the same person, scene
   and outfit, with only natural action progression.

Consecutive segments of the same video stay sequential.
Per-message generation caps are respected; when a quota is hit,
continue in a later message until the full video is done.

## Quick start

1. Read `docs/workflow.md` for the full pipeline.
2. Read `docs/publishing.md` for the publish checklist.
3. Read `docs/prompt-library.md` for dance-style / hand-action /
   camera-move pools (pick randomly per generation, never the
   same set every time).
4. Run the ffmpeg helpers in `scripts/` for chaining, trimming,
   soft-focus, audio strip and music mixing.

## Publishing checklist (summary)

- Strip original audio from the generated file, verify no audio stream.
- Trim the first 2 seconds.
- Mix in a fresh track for this video only (never reuse the last video's track).
- Audit junctions at the shifted points (e.g. 8s / 18s for a 30s video
  trimmed by 2s, not 10s / 20s). A jump = discard that part.
  If only 20s passes, post 20s only; if only 10s passes, do not post.
- Title: adapt a trending hook, do not invent a flat title.
- Cover: platform AI-recommended cover, never the first one
  (it usually has text); prefer the 2nd or 3rd.
- Location: pick randomly from the available options.
- Platform music: also select a matching hot track in the web
  publish panel for music traffic — this only changes the
  bottom music display, the file's own mixed audio is what plays.
- SMS verification: click "get code" once, then wait for the
  user's code; never auto-fetch or re-click.

## License

MIT — see `LICENSE`.
