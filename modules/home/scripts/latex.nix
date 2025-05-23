{pkgs, ...}:
pkgs.writeShellScriptBin "latex" ''
  FILENAME="main.tex"

  if [ -f "$FILENAME" ]; then
  	echo "File '$FILENAME' already exists. Overwrite? (y/n)"
  	read answer
  	if [ "$answer" != "y" ]; then
  		echo "Aborted."
  		exit 1
  	fi
  fi

  echo "Title: "
  read TITLE

  echo "Author: "
  read AUTHOR

  mkdir setup
  mkdir sections

  cat <<EOL >"setup/headers.tex"
  \\documentclass[12pt]{article}

  \\usepackage[a4paper,margin=1in]{geometry}
  \\usepackage{setspace}
  \\usepackage{lmodern}
  \\usepackage[english]{babel}
  \\usepackage{mathtools,amsthm,amssymb,amsmath}
  \\numberwithin{equation}{section}
  \\usepackage{booktabs} % For better-looking tables
  \\usepackage{dcolumn}  % For aligning decimal points in tables
  \\usepackage{hyperref}
  \\usepackage{marvosym}
  \\usepackage{eurosym}
  \\usepackage{bm}
  \\usepackage{graphicx}
  \\usepackage[longnamesfirst]{natbib}
  \\usepackage{float}
  \\usepackage{longtable}
  \\usepackage{caption}
  \\usepackage{listings}
  \\usepackage{xcolor}
  \\usepackage[numbib]{tocbibind}

  \\bibliographystyle{rug-econometrics}
  \\settocbibname{References}

  \\lstdefinelanguage{SQL}{
      keywords={SELECT, FROM, WHERE, INSERT, INTO, UPDATE, DELETE, CREATE, TABLE, ALTER, DROP, JOIN, ON, AND, OR, NOT, NULL, PRIMARY, KEY},
      keywordstyle=\color{blue}\bfseries,
      comment=[l]{--},
      commentstyle=\color{gray}\ttfamily,
      stringstyle=\color{red},
      morestring=[b]',
      morestring=[b]"
  }

  \\lstdefinelanguage{Python}{
      keywords={def, return, if, elif, else, while, for, in, try, except, finally, with, as, import, from, class, pass, break, continue, and, or, not, is, None, True, False, lambda, yield, global, nonlocal, assert, raise},
      keywordstyle=\color{blue}\bfseries,
      comment=[l]\#,
      commentstyle=\color{gray}\ttfamily,
      stringstyle=\color{red},
      morestring=[b]',
      morestring=[b]"
  }

  \\lstset{
      basicstyle=\ttfamily,
      columns=fullflexible,
      language=SQL,
      frame=single,
      backgroundcolor=\color{gray!10}
  }

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
  \\newcommand{\E}[1]{\,\mathsf{E}\left[#1\right]}
  \\newcommand{\EE}[2]{\,\mathsf{E}_{#1}\left[#2\right]}
  \\newcommand{\V}[1]{\,\mathsf{V}\left[#1\right]}
  \\newcommand{\cov}[1]{\,\mathsf{Cov}\left[#1\right]}
  \\renewcommand{\d}[1]{\,\textrm{d}#1}
  \\newcommand{\1}[1]{\,I_{#1}} % indicator
  \\renewcommand{\P}[1]{\,\mathbb{P}\left\{#1\right\}}
  \\renewcommand{\cos}[1]{\text{cos}\left[#1\right]}
  \\newcommand{\fat}[1]{\ThisStyle{\hstretch{1.2}{\ooalign{%
    \kern.46pt$\SavedStyle#1$\cr\kern.33pt$\SavedStyle#1$\cr%
    \kern.2pt$\SavedStyle#1$\cr$\SavedStyle#1$}}}}
  \\renewcommand{\ln}[1]{\,\mathrm{ln}\left[#1\right]}
  \\newcommand*{\B}[1]{\ifmmode\bm{#1}\else\textbf{#1}\fi}
  EOL

  cat <<EOL >>"setup/title.tex"
  \\title{$TITLE}
  \\author{$AUTHOR}
  \\date{\today}
  \\begin{document}
  \\maketitle
  EOL

  cat <<EOL >>"setup/footer.tex"
  \\end{document}
  EOL

  cat <<EOL >>"main.tex"
  \\input{setup/headers.tex}
  \\input{setup/title.tex}
  \\input{setup/footer.tex}
  EOL

  ${pkgs.libnotify}/bin/notify-send "LaTeX project created succesfully!"
  $EDITOR $FILENAME
''
