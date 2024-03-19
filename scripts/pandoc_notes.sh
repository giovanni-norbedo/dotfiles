pandoc --from markdown --to pdf $1.md -o $1.pdf --pdf-engine=xelatex --standalone --toc --toc-depth=$2 --number-sections
