# -- Variables
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.histfile 
export HISTTIMEFORMAT='%F %T '
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPS='--extended'
export PATH=${PATH}:$HOME/.config/weareone
export PATH=${PATH}:$HOME/.SAPClients/SAPGUI/bin/guilogon
export PATH=${PATH}:$HOME/.amplide_linux64/amplide/amplide

export ORACLE_HOME=/usr/lib/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export PATH=$PATH:$ORACLE_HOME/bin
export $(dbus-launch)





# -- history 
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt extended_glob
setopt inc_append_history

# "dir" instead of "cd dir"
setopt AUTO_CD



# move files to .Trash, or when "-rf" is set remove files entirely
function moveTrash() {
if [[ "$1" == "-rf" ]]; then
    rm -rf "${@:2}"
else
    for i in "$@"; do
        cp -r -t ~/.Trash $i && rm -rf $i
    done

fi
}


# -- load stuff
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.vi-mode.zsh # responsible for the prompt
zstyle ':completion:*' rehash true


# -- Alias
alias q="clear"
alias p="exit"
alias i='sxiv -t'
alias x="dtrx"
alias down="cd ~/.down"
alias pdf="zathura"
alias kill='killall -9'
alias xclip='xclip -selection clipboard'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""' #### Class name of window
alias wp="nitrogen ~/media/wallpapers"  ### Set up a new wallpaper
alias rm="moveTrash"
alias neofetch="neofetch --w3m ~/media/wallpapers/japenese_hills.jpg"
alias ncdu="ncdu --color" ### Tui alternative of 'du'


# -- obsolete
# alias decrypt="/usr/bin/decrypt.sh"
# alias gl='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
# alias merge='pdftk *.pdf cat output' # USAGE: merge output_name.pdf
