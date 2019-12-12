# -- VARIABLES
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.histfile 
export HISTTIMEFORMAT='%F %T '
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPS=' --extended '
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#d9d6cf,bg+:#3f3442,hl+:#d858fe
--color=info:#625566,prompt:#d5a8e3,pointer:#9c75dd,marker:#e5c07b,spinner:#d5a8e3,header:#d5a8e3

--bind ,:cancel,tab:accept
--reverse
'
# --bind ,:cancel ->clears query string if not empty, aborts fzf otherwise

# -- HISTORY 
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

# -- "dir" instead of "cd dir"
setopt AUTO_CD


# -- move files to .Trash, or when "-rf" is set don't do anything at all
function moveTrash() {
    if [[ "$1" == "-rf" ]]; then
        rm -rf "${@:2}" 
    else
        for i in "$@"; do
            cp -r -t ~/.Trash $i && rm -rf $i
        done

    fi
}

function viewImage(){ sxiv -qopt "$@" | \xclip -selection clipboard && rm *.exiv* }
function viewPdf(){ zathura "$1" >/dev/null 2>&1 & }
function vim_one_instance() {
    i3-msg 'move container to workspace number " 3:vim "' > /dev/null 2>&1 
    i3-msg 'workspace " 3:vim "' > /dev/null 2>&1   #switch to workspace
    
    command vim --servername $(command vim --serverlist | head -1) --remote-silent "$@"
    exit
}

# -- load stuff
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.vi-mode.zsh                # responsible for the prompt
source $HOME/.zsh-vi-search.zsh           # Adds support for searching the current line (in normal vi mode) to zsh.
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

# -- some keybinds
bindkey ",f" fzf-history-widget #fzf history search
bindkey ",fd" fzf-cd-widget      #fzf cd
bindkey ",ff" fzf-file-widget    #fzf find file
bindkey "^[[A" history-beginning-search-backward # completion based on input
bindkey "^[[B" history-beginning-search-forward  # completion based on input   

# -- Alias
alias down="cd ~/.down"
alias sxiv="viewImage" #in sxix: mark files with "m", close with "q" -> auto copy fnames to clipboard
alias kill='killall -9'
alias ncdu="ncdu --color dark" #Tui alternative of 'du'
alias p="exit"
alias pdf="viewPdf" #put the terminal in background when opening a pdf (makes them closeable)
alias q="clear" #use Ctrl-l instead
alias rm="moveTrash"
alias trans="trans -show-original-dictionary y" #translate from commandline
alias wp="nitrogen ~/media/wallpapers"  #set up a new wallpaper
alias x="dtrx -noq"
alias xclip='xclip -selection clipboard'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""' #class name of window
alias pmpv='mpv --ytdl-raw-options="yes-playlist="' #mpv to play yt playlists
alias vim="vim_one_instance" #vim: only one instance
alias cat="bat --theme TwoDark" #cat on steroids
