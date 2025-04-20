#!/bin/bash
pandoc "$1" -o "${1%.org}.pdf" --number-sections
