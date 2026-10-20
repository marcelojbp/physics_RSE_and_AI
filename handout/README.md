# Course notes

**[`notes.pdf`](notes.pdf)**: background for every block of the course, for going
further after it. Part I follows the slides block by block, Part II has the git cheat
sheet and the verification checklist (also as [`checklist.md`](checklist.md)), Part III
the annotated references, each checked to exist.

Draft: the red box marks the section on trends, still to be extended. Code listings
are read from [`../DrivenSpin`](../DrivenSpin) when the PDF is built, so they stay in
sync with the project.

Build from source (pdfLaTeX, TeX Live 2025):

```bash
cd handout
latexmk -pdf notes.tex
```
