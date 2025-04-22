#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <filename.tex>"
	exit 1
fi

FILENAME="$1"

if [ -f "$FILENAME" ]; then
	echo "File '$FILENAME' already exists. Overwrite? (y/n)"
	read answer
	if [ "$answer" != "y" ]; then
		echo "Aborted."
		exit 1
	fi
fi

cat <<EOL >"$FILENAME"
\\documentclass[a4paper,11pt]{article}

\\usepackage[english]{babel}
\\usepackage{mathtools,amsthm,amssymb,amsmath}
\\numberwithin{equation}{section}
\\usepackage{booktabs} % For better-looking tables
\\usepackage{dcolumn}  % For aligning decimal points in tables
\\usepackage{bm}
\\usepackage{hyperref}
\\usepackage{ marvosym }
\\usepackage{eurosym}
\\usepackage{bm}
\\usepackage{graphicx}
\\usepackage{subfig}

\\setlength{\parindent}{0pt}     % No paragraph indentation
\\setlength{\parskip}{1em}       % Add vertical space between paragraphs

\\newcommand{\N}[1]{\mathcal{N}\left(#1\right)}
\\newcommand{\Z}{\mathbb{Z}}
\\DeclareMathOperator*{\argmin}{arg\,min}
\\DeclareMathOperator*{\argmax}{arg\,max}
\\newcommand{\abs}[1]{\left\vert#1\right\vert}
\\newcommand{\given}{\,\middle|\,}
\\newcommand{\Bern}[1]{\mathrm{Bern}(#1)}
\\newcommand{\Bin}[1]{\mathrm{Bin}(#1)}
\\newcommand{\Exp}[1]{\mathrm{Exp}(#1)}
\\newcommand{\FS}[1]{\mathrm{FS}(#1)}
\\newcommand{\Geo}[1]{\mathrm{Geo}(#1)}
\\newcommand{\Norm}[1]{\mathrm{Norm}(#1)}
\\newcommand{\Pois}[1]{\mathrm{Pois}(#1)}
\\newcommand{\Unif}[1]{\mathrm{Unif}(#1)}
\\newcommand{\E}[1]{\,\mathbb{E}\left[#1\right]}
\\newcommand{\EE}[2]{\,\mathsf{E}_{#1}\left[#2\right]}
\\newcommand{\V}[1]{\,\mathsf{V}\left[#1\right]}
\\newcommand{\cov}[1]{\,\mathsf{Cov}\left[#1\right]}
\\renewcommand{\d}[1]{\,\textrm{d}#1}
\\newcommand{\1}[1]{\,I_{#1}} % indicator
\\renewcommand{\P}[1]{\,\mathbb{P}\left\{#1\right\}}
\\newcommand{\fat}[1]{\ThisStyle{\hstretch{1.2}{\ooalign{%
  \\kern.46pt$\SavedStyle#1$\cr\kern.33pt$\SavedStyle#1$\cr%
  \\kern.2pt$\SavedStyle#1$\cr$\SavedStyle#1$}}}}
\\renewcommand{\ln}[1]{\,\mathrm{ln}\left[#1\right]}
\\newcommand*{\B}[1]{\ifmmode\bm{#1}\else\textbf{#1}\fi}
\\title{}
\\author{Koen Stevens}
\\date{\today}
\\begin{document}
\\maketitle
\\end{document}
EOL

notify-send "LaTeX file '$FILENAME' created."
nvim $FILENAME
