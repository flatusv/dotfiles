# -- VARIABLES
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.histfile 
export HISTTIMEFORMAT='%F %T '
export DISPLAY=:0.0



# -- HISTORY 
setopt APPEND_HISTORY     # Don't erase history
setopt EXTENDED_HISTORY   # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS  # Don't show duplicates in search
setopt SHARE_HISTORY      # Share history between session/terminals
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt extended_glob
setopt inc_append_history

setopt aliases # enable aliases in non-interactive shells
# -- "dir" instead of "cd dir"
setopt AUTO_CD
setopt +o nomatch

export EDITOR=/usr/bin/vim
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPS=' --extended '
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#d9d6cf,bg+:#3f3442,hl+:#d858fe
--color=info:#625566,prompt:#d5a8e3,pointer:#9c75dd,marker:#ff0000,spinner:#d5a8e3,header:#d5a8e3

--bind ,:cancel,tab:accept,esc:ignore,right:toggle+up
--reverse
'

# -- load zsh functions located at .zshrc.d and more
for file in ~/.zshrc.d/*;
do
  source $file
done

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.vi-mode.zsh                # responsible for the prompt
source $HOME/.zsh-vi-search.zsh          # Adds support for searching the current line (in normal vi mode) to zsh.
source /usr/share/LS_COLORS/dircolors.sh # via: lscolors-git
zstyle ':completion:*' rehash true

# -- ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

# -- ci{, ci(
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

# -- surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# -- ssh/scp completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

# -- edit command in vim, when hitting ':' in normal mode
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd : edit-command-line

# -- some keybinds
bindkey ",f" fzf-history-widget                  # fzf history search
bindkey ",fd" fzf-cd-widget                      # fzf cd
bindkey ",ff" fzf-file-widget                    # fzf find file
bindkey "^[[A" history-beginning-search-backward # completion based on input
bindkey "^[[B" history-beginning-search-forward  # completion based on input
bindkey "^H" backward-kill-word                  # behaves like Control-W in vim

# -- Alias: prefixes with f_ denote functions located at .zshrc.d
#
#------------------------------------------------------------------------------------------------------------
#| ALIAS  | DESCRIPTION
#------------------------------------------------------------------------------------------------------------
#| cat:   | cat on steroids
#| gds:   | git diff of fzf selection with immediat copy to clipboard. Easy follow up with: git add <paste> ...
#| gfetch: | view git remote changes before pull
#| gshow: | file content of a previous git commit
#| mpv:   | mpv to play yt playlists
#| ncdu:  | Tui alternative of 'du'
#| pdf:   | put the terminal in background when opening a pdf (makes them closeable)
#| rg:    | ripgrep case insensitive
#| sxix:  | mark files with "m", close with "q" -> auto copy fnames to clipboard
#| trans: | translate from commandline
#| vim:   | only one instance of vim 
#| wp:    | set up a new wallpaper
#| xp:    | class name of window
#------------------------------------------------------------------------------------------------------------
alias bib="f_bibtex"                                                                               
alias cat="bat --style=plain --pager=never"      
alias cp="advcp -g"
alias down="cd ~/.down"
alias gcm="git commit -m"
alias gds='data=$(git diff --name-only | fzf -m) && git diff $(echo "$data") && echo "$data" | xclip'
alias gfetch='echo "[INFO]: changes to be pulled..." && git fetch origin && git diff master..origin/master' 
alias gshow="f_gshow" # 
alias kill='killall -9'
alias ls="ls --color=auto"                                                                            
alias mpv="f_mpv"                                
alias mv="advmv -g"
alias ncdu="ncdu --color dark"                   
alias p="exit"
alias pdf="f_viewPdf"                                                                               
alias pdflatex="pdflatex --shell-escape"
alias q="clear"                                  
alias rg="rg -i"                                 
alias rm="f_moveTrash"
alias sxiv="f_viewImage > /dev/null 2>&1"        
alias textidote="f_textidote"                    
alias trans="trans -show-original-dictionary y"  
alias vim="f_vim_one_instance"                   
alias wp="nitrogen ~/media/wallpapers"           
alias x="dtrx -noq"
alias xclip='xclip -selection clipboard'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""' 
alias yay="paru"
alias yymirr="ssh yymirr@mythrill"
alias geeray="ssh geeray@mythrill"

#-- FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#-- SSH
/usr/bin/keychain -Q -q --nogui ~/.ssh/id_rsa
[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh
