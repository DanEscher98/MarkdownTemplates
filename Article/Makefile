TARGET	= article
FLAGS 	= --toc --standalone --citeproc

pdf :
	pandoc $(TARGET).md -o $(TARGET).pdf $(FLAGS)

html :
	pandoc $(TARGET).md -o $(TARGET).html $(FLAGS)

docx :
	pandoc $(TARGET).md -o $(TARGET).docx $(FLAGS)

clear :
	rm -f *.docx *.html *.pdf
