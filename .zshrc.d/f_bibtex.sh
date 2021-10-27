#/bin/bash

# compile the files needed for bibliography in latex
function f_bibtex(){ 

    rm *.{html,aux,bbl,blg,glg,glo,ist,log,out,toc}

    texFile="$@"
    bibFile=$"$(basename $(echo $texFile) .tex)"
    

    # compile twice
    pdflatex -shell-escape $texFile
    pdflatex -shell-escape $texFile

    bibtex $bibFile

    pdflatex -shell-escape $texFile
    pdflatex -shell-escape $texFile

    bibtex $bibFile

    # create list of abbreviations too
    makeglossaries $bibFile

    pdflatex -shell-escape $texFile
    pdflatex -shell-escape $texFile

}
