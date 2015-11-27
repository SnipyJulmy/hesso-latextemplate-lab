TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
MAIN = report.tex
FINAL = report.pdf

.PHONY: all clean

all : ${FINAL}

${FINAL} : ${MAIN}
	${TEX} ${MAIN}
	${TEX} ${MAIN} # run twice for labels etc

clean : 
	@rm *.bbl || true
	@rm *.log || true
	@rm *.out || true
	@rm *.blg || true
	@rm *.toc || true
	@rm *.aux || true
	@rm *.bak || true
	@rm *.pyg || true
	@rm *.backup || true
	@rm *.lof || true
	@rm *.synctex.gz || true
	@rm -rf _minted* || true
	@rm ${FINAL} || true 
