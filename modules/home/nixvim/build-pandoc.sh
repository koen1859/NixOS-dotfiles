#!/bin/bash
pandoc "$1" -o "${1%.org}.pdf" --citeproc --pdf-engine=xelatex --bibliography=literature.bib
