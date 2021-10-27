#!/bin/bash

function f_gshow(){

    # file to show contents of a different commit
    file="$1"

    if [ $# -eq 0 ] # "No arguments supplied"
      then
            git show $(git log --pretty=oneline --abbrev-commit | fzf | cut -d ' ' -f1) \
                | bat --style=plain --pager=never
      else  
            # list of languages bat knows about
            languageList=$(bat --list-languages)

            # get the commit hash
            commit=$(git log --pretty=oneline --abbrev-commit "$file" | fzf | cut -d ' ' -f1)

            basename=$(basename -- "$file") # extract base name from path
            extension="${file##*.}"         # *.{java,tex,txt}
            filename="${file%.*}"           # get filename. This is empty for hidden files

            if [ -z "$filename" ] # process a hidden file
                then
                    if [[ "$basename" == *rc ]] # check for .{zsh,vim}rc files
                        then
                            rcFile=${basename:1:-2} # from ".zshrc" remove <dot> and <rc>
                            batLang=$(echo "$languageList" | grep -Eo $rcFile | uniq)

                            if [ -z "$batLang" ] # language not supported from bat
                                then # treat as bash file
                                    git show "$commit:./$file" | bat --style=plain --pager=never -l bash 
                                    echo -e "\n[INFO]: Interpreted as bash"
                                else
                                    git show "$commit:./$file" | bat --style=plain --pager=never -l $batLang
                                    echo -e "\n[INFO]: Interpreted as $batLang"
                            fi
                        else
                            git show "$commit:./$file" | bat --style=plain --pager=never -l bash 
                            echo -e"\n[INFO]: Interpreted as bash"
                    fi
                else # process regular file
                    if [[ $(echo "$languageList" | grep -Eo $extension | uniq) ]] # language not supported from bat
                        then
                            git show "$commit:./$file" | bat --style=plain --pager=never -l $extension
                            echo -e "\n[INFO]: Interpreted as $extension"
                        else
                            git show "$commit:./$file" | bat --style=plain --pager=never -l bash

                            echo -e "\n[INFO]: Interpreted as bash"
                    fi
            fi
    fi

}



