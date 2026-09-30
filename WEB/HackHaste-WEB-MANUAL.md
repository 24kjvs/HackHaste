# HackHaste WEB MANUAL

The public site. Author-owned. The generator **copies** `WEB/` into `dist/WEB/` and **never writes a file inside it**.

*Expedited Typing Across* **OS***es* *Integrated Natively Salvaging Home Rows*

## What this folder is

`WEB/` is the GitHub Pages house: iron plates, bone type, a live typing cluster, and a try-it box that remaps physical QWERTY keys to HackHaste without installing a layout.

Doctrine stays in [README.md](../README.md). Install stays in [HackHaste-MANUAL.md](../HackHaste-MANUAL.md). Phrases stay in [LEARNING HACKHASTE/](../LEARNING%20HACKHASTE/). This folder is only the site.

## Files

| File | Job |
| --- | --- |
| `index.html` | The site |
| `hackhaste-web.css` | Iron / bone, night and day |
| `hackhaste-web.js` | Board, phrases, physical-key try-it |
| `favicon.svg` | Bindrune on iron |
| `404.html` | Missing plate |
| `.nojekyll` | Stop GitHub Pages from running Jekyll on this folder |
| `HackHaste-WEB-MANUAL.md` | This file |

The bindrune and the layout PNGs are **not** duplicated here. The HTML points at `../source/visuals/`. Serve the site from the repository root so that path exists.

The door at the repository root (`index.html`, `404.html`, `.nojekyll`) sends GitHub Pages visitors into `WEB/`. Those three files are also author-owned; the generator copies them and does not write them.

## Preview

From the repository root (not from inside `WEB/`):

```
python3 -m http.server 8765
```

Open [http://127.0.0.1:8765/WEB/](http://127.0.0.1:8765/WEB/). Opening `WEB/index.html` as a `file://` page still loads the CSS and JS; the layout PNGs still resolve via `../source/visuals/` if the folder next door is present.

## GitHub Pages

`dist/` is the public GitHub project root. After assemble, it contains `WEB/`, `source/visuals/`, and the door `index.html`.

In the GitHub repo that is `dist/`:

1. Settings → Pages
2. Deploy from a branch
3. Folder: `/ (root)`

The door refreshes to `/WEB/`. Do not set the Pages folder to `/docs`; this site is not named docs.

## If the map changes

`hackhaste-web.js` stores `LAYOUTS` by hand, in lockstep with the author’s map. The generator must not rewrite this file. After a map change, update `LAYOUTS`, `FINGER`, and `PHRASE` here, then look at the live board and the try-it box.

## Theme

Night, day, or auto (`prefers-color-scheme`). The choice is `localStorage` key `hh-theme`. **Night is the default.** The HTML root ships `data-hh-theme="night"` so the first paint is iron even before the script runs, and even if the OS is in light mode. Auto still follows the OS once the visitor picks it. The layout PNGs are the typing cluster only (no F-row, nav island, or numpad), with bone bezels and a choir-gold title so they read on both papers.

## What the generator is forbidden to do

Never write `WEB/index.html`, `WEB/hackhaste-web.css`, `WEB/hackhaste-web.js`, `WEB/favicon.svg`, `WEB/404.html`, `WEB/.nojekyll`, or this manual. Copy the folder. That is all.
