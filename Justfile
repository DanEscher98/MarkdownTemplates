TARGET  := `basename $PWD`
FLAGS   := '--shell-escape --interaction=nonstopmode'

# Compiles the main.txt to pdf
compile:
  @bash -c "source ./src/format.sh; remove_name"
  pdflatex {{FLAGS}} main.tex 1> /dev/null
  @pdflatex {{FLAGS}} main.tex 1> /dev/null # 2nd compilation for TOC
  @bash -c "source ./src/format.sh; restore_name"
  @mv main.pdf {{TARGET}}.pdf
  @echo -e "📖 {{TARGET}}.pdf \e[32mready\e[0m"
 
# Open the pdf with `evince`
open:
  @evince --fullscreen --page-index=1 {{TARGET}}.pdf
  @cp {{TARGET}}.pdf `echo $HOME/Downloads`

# New entry with date as name, default editor `vi`
note:
  lvim `bash -c "source ./src/format.sh; daily_note"`

# Restore complete names from src/titles.txt
restore:
  bash -c "source format.sh; restore_name"
 
# Remove unnecesary files after compile
clear:
  @rm -rdf _markdown_main/
  @rm -f *.out *.aux *.toc *.lua *.log *.err
  @clear && exa
