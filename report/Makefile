TEX = pdflatex -shell-escape -file-line-error # -interaction=nonstopmode
MAIN = report.tex
FINAL = report.pdf

.PHONY: all clean clean_all

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
	@rm *.run.xml || true
	@rm *.bcf || true
	@rm -rf _minted* || true

clean_all : clean
	@rm ${FINAL} || true 
	
