export ZSH=/home/geeray/.oh-my-zsh # Path of oh-my-zsh installation.
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

export VISUAL="vim" 

autoload -U compinit && compinit                                               
source ~/.npm-completion.sh
autoload -U url-quote-magic
zle -N self-insert url-quote-magic





#
#   Oh-my-zsh: for beautiful prompts

 ZSH_THEME="clean"               # Zsh theme, choose from .oh-my-zsh/themes/
 plugins=(git zsh-256color)      # Plugins to load

if [[ -s "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi


#
#   User specific alias
#
alias q="clear"
alias p="exit"
alias i='sxiv -t'
alias x="dtrx"
alias down="cd /home/geeray/.down"
alias pdf='zathura'
alias yaourt='yaourt --noconfirm'
alias kill='killall -9'
alias pacgraph='sudo pacgraph -c'
alias xclip='xclip -selection clipboard'
# alias cc="paccache -k 3 -u -d"
alias decrypt="/usr/bin/decrypt.sh"
alias merge='pdftk *.pdf cat output' # USAGE: merge output_name.pdf
alias yt='mpv --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]" 
'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""' #### Class name of window
alias wp="nitrogen ~/media/wallpapers"  ### Set up a new wallpaper

#####History Search##############
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

export SAL_USE_VCLPLUGIN=gen





setopt extended_glob
