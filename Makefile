TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
MAIN = base_model.tex
FINAL = rapport

.PHONY: all clean

all : ${FINAL}.pdf

${FINAL}.pdf : ${MAIN}
	${TEX} ${MAIN}

clean : 
	@rm *.bbl || true
	@rm *.pdf || true
	@rm *.log || true
	@rm *.out || true
	@rm *.blg || true
	@rm *.toc || true
	@rm *.aux || true
	@rm *.bak || true
	@rm *.pyg || true
	@rm *.backup || true
	@rm *.lof || true
