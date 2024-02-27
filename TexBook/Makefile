SHELL := /usr/bin/bash
TARGET 	= $(shell basename $(PWD))
FLAGS	= --shell-escape --interaction=nonstopmode

$(TARGET).pdf: main.tex $(shell find ./Files -type f)
	@bash -c "source ./format.sh; remove_name"
	pdflatex $(FLAGS) main.tex 1> /dev/null
	@pdflatex $(FLAGS) main.tex 1> /dev/null # 2nd compilation for TOC
	@bash -c "source ./format.sh; restore_name"
	mv main.pdf $(TARGET).pdf

pdf: $(TARGET).pdf clear
	@evince $(TARGET).pdf

clear:
	@rm -rdf _markdown_main/
	@rm -f *.out *.aux *.toc *.lua *.log *.err
	@clear && exa

.PHONY: clear

