# HES-SO//Master Lab report LaTeX template

A LaTeX template for HES-SO//Master Computer Science lab reports.

Authors:

- Sylvain Julmy <sylvain.julmy@master.hes-so.ch>
- Marc Demierre <marc.demierre@master.hes-so.ch>

## Features

- Nice title page with school logos and lab info
- Header and footer with lab information
- Code highlighting with minted
- Nice default typography settings (by default the template uses lmodern fonts, but you can easily change the fonts in the preamble if needed)

## Dependencies and setup

### Dependencies

- A recent LaTeX distribution
- Python 2.7+ or 3+ and pygments (for the minted code highlighting package)
- For information, the following package are needed for the `hessoreport` document class :
    - etoolbox
    - inputenc
    - fontenc
    - lmodern
    - sourcecodepro
    - babel [english]
    - blindtext
    - fullpage
    - fancyhdr
    - xcolor
    - graphicx
    - titlesec
    - minted
    - lscape
    - tikz
    - amsmath
    - float
    - caption
    - microtype
    - parskip
    - nowidow
    - multirow
    - hyperref
    
### Setup on OSX

1. Install a LaTeX distribution, like MacTex (https://tug.org/mactex/). Make sure the bin directory is in your `PATH`.
2. Upgrade your LaTeX distribution. With MacTex, this can be done using the built-in "TeXLive Utility" software.
3. Python is provided by default on OSX (we recommend using homebrew to get the latest version though), you just need to install the pygments package:

        pip install pygments

### Setup on Windows

1. Install a LaTeX distribution, like MiKTeX (http://miktex.org/). Make sure the bin directory is in your `PATH`.
2. Install the biber package
3. Install Python from https://www.python.org/downloads/windows/. Be sure to check the PATH option in the installer.
4. Install the pygments package

        pip install pygments

### Setup on Linux

If you use Linux, you're used to not having precise instructions. Just do it!

More seriously, the only pain point is probably the old package versions if you use an inferior distribution whose repository has an old version of TeXLive. We recommend to install TexLive manually in this case, or to use Arch.

For Ubuntu 12.04+ users, this repository might be useful:

https://github.com/scottkosty/install-tl-ubuntu/

## Getting started

### General steps

1. Install the dependencies (see previous section)
2. Clone this repository, go to the directory where you want to create a report and use the `getreport.py` script to generate it.
3. Write your report
4. Build the PDF (see below)

### Write your report

In order to use the `hessoreport` document class, simply change the type of your documentclass command :
```
\documentclass{hessoreport}
```

For information about the document, just use the following command :
```
\School{University of Applied Sciences Western Switzerland}
\Faculty{MSE - Software Engineering}
\Place{Lausanne}
\Course{<Course>}
\Title{<Title>}
\Supervisors{<Supervisors>}
\Authors{<Authors>}
```

Then just write your document !
```
\documentclass{hessoreport}

\School{University of Applied Sciences Western Switzerland}
\Faculty{MSE - Software Engineering}
\Place{Lausanne}
\Course{<Course>}
\Title{<Title>}
\Supervisors{<Supervisors>}
\Authors{<Authors>}

\begin{document}

\frontmatter
\thispagestyle{empty}       % to remove header / footer on title page

\maketitle
\thispagestyle{empty}         % to remove header / footer on title page

% \tableofcontents
% \thispagestyle{empty}   % to remove header / footer on title page

\mainmatter

\chapter{Chapter example}

\begin{figure}[H]
    \centering
    \fbox{
    \includegraphics[width=0.4\textwidth]{img/logo_hes-so}}
    \caption{caption}
    \label{fig:hesso_logo}
\end{figure}

\begin{javacode}
    int a = 2;
\end{javacode}

\blinddocument

\end{document}
```

### Building using the command line

You could use the command line to build your document, the exact command is :
```
> pdflatex -shell-escape <your_report>.tex
```

The other way is to use a Makefile (!!!)

### Building using a Makefile

A Makefile is provided so you can just use `make` to build the PDF. A `make clean` command will delete all the pdflatex build files exept the pdf and the `make clean_all` will delete all of them.
By default, the option `-interaction=nonstopmode` is disabled. The reason is it's more pleasant to show the error while compiling the document using the command line interface (or using vim with the `:make` command !).

```
TEX = pdflatex -shell-escape -file-line-error # -interaction=nonstopmode
MAIN = <your_report>.tex
FINAL = <your_report>.pdf

.PHONY: all clean clean_all

all : ${FINAL}

${FINAL} : ${MAIN}
	${TEX} ${MAIN}
	${TEX} ${MAIN} # run twice for labels etc

clean :
	@rm *.bbl || true
	@rm *.log || true
	@rm *.fls || true
	@rm *.out || true
	@rm *.blg || true
	@rm *.toc || true
	@rm *.aux || true
	@rm *.fdb_latexmk || true
	@rm *.bak || true
	@rm *.pyg || true
	@rm *.backup || true
	@rm *.lof || true
	@rm *.synctex.gz || true
	@rm *.run.xml || true
	@rm *.bcf || true
	@rm -rf _minted* || true

clean_all : clean
	@rm ${FINAL} || true

```

### Building using the Texmaker IDE

Use this configuration for the quick build:

    pdflatex -shell-escape -synctex=1 -interaction=nonstopmode %.tex|pdflatex -shell-escape -synctex=1 -interaction=nonstopmode %.tex

## Contributing

Do not hesitate to make a pull request if you have useful additions/corrections for this template. You can also post an issue if you find a bug or want to suggest an improvement.
