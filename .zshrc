# -- Variables
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.histfile
export VISUAL="vim" 
export EDITOR="vim" 
export SAL_USE_VCLPLUGIN=gen
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPS='--extended'
export PATH=${PATH}:$HOME/.config/weareone

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

precmd(){
if [[ "$PWD" == "$HOME" ]]; then
     # Zsh prompt expansion syntax
    PS1="%B%{$fg[cyan]%}%u%b >%{$fg[red]%}>%B%(?.%{$fg[cyan]%}.%{$fg[cyan]%})>%{$reset_color%}%b "
else
    PS1="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[red]%}>%B%(?.%{$fg[cyan]%}.%{$fg[cyan]%})>%{$reset_color%}%b "
fi

}


# -- Terminal related
TERM="xterm-256color"
stty -ixon


# load stuff
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (cat ~/.cache/wal/sequences &)




# Alias
alias q="clear"
alias p="exit"
alias i='sxiv -t'
alias x="dtrx"
alias down="cd ~/.down"
alias pdf="zathura"
alias kill='killall -9'
alias xclip='xclip -selection clipboard'
alias decrypt="/usr/bin/decrypt.sh"
alias merge='pdftk *.pdf cat output' # USAGE: merge output_name.pdf
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""' #### Class name of window
alias wp="nitrogen ~/media/wallpapers"  ### Set up a new wallpaper
alias rm="moveTrash"
alias bulkr="qmv"
alias neofetch="neofetch --w3m /home/geeray/media/wallpapers/japenese_hills.jpg"

# Git Alias
alias gl='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
