# Slides

Beamer slides for the course: **[`main.pdf`](main.pdf)**. Draft: the date and the
repository URL on the slide "Getting started" are still to be filled in.

Build from source (pdfLaTeX, TeX Live 2025):

```bash
cd slides
latexmk -pdf main.tex
```

`main.tex` inputs one file per block from `sections/`; the theme files
(`unibasel*`, `beamerthemeunibasel.sty`) are the University of Basel Beamer template.
