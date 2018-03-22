export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export VISUAL="vim" 
export SAL_USE_VCLPLUGIN=gen
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPS='--extended'
setopt extended_glob
TERM="xterm-256color"
stty -ixon



# load stuff
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/.zsh-powerline.sh


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

# Git Alias
alias gl='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
