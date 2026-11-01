# 30-second dance video workflow

## Image-first, never text-to-video directly

1. Create / clean a few still images first.
2. Generate video from those images.
3. Segment length: 10 seconds per segment.

## Tail-frame chaining

- Segment 1: face close-up as the first image, outfit as later references.
- Segments 2-3: the first image MUST be the previous segment's
  last frame itself; a face close-up is only a later reference.
- Extract a tail frame with:
  `ffmpeg -y -v error -sseof -0.05 -i <prev.mp4> -frames:v 1 tail.png`
- Concatenate with ffmpeg concat. Never loop a 10s clip to fake 30s.

## Visual standard

- Women in their 20s, East Asian features, made-up beauty-filter look.
- Art-level realism: declare AI as required, but the video must not
  look obviously AI at first glance; avoid over-smoothed doll skin.
- Phone-shot realism: natural skin texture, light and imperfections.
- Lighting: restore each image's original lighting / light source;
  do not flatten to bright studio light.
- Background: simple, almost empty, at most one element
  (door, curtain, full-length mirror, or a lived-in dorm scene).
  Keep the scene type, change the layout substantially.
- Edits: minimal, single-purpose prompts. Change only what was asked;
  stacking modifiers redraws the face and light.
- When compositing, anchor the face source as the base and swap
  only the outfit; otherwise the generator lets the most complete
  outfit image dominate, including its face.
- Slightly change jewelry, hairstyle and face in every edit, so the
  result is not an identical copy of any reference.

## Soft focus (post-processing only, never in a prompt)

`ffmpeg -y -v error -i input.webp -vf "gblur=sigma=2.5" output-blur25.webp`

## Speed, hands, camera — random per generation

- Action: brisk, crisp, medium-fast. No slow-motion dragging.
- Hand action: randomly pick ONE from the pool in
  `docs/prompt-library.md`, matched to the style, different from
  the previous segment. Hand-roaming is only one option, never
  a default for every segment.
- Camera: basically fixed, no strong push-in. Randomly pick one:
  fixed, slight push-in, slight pull-out, slight pan, slight tilt.
- Dance style: randomly pick one per generation from the library.
