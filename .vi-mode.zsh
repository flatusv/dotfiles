function insert-mode () { echo "-- INSERT --" }
function normal-mode () { echo "-- NORMAL --" }

precmd () {
    if [[ "$PWD" == "$HOME" ]]; then
     # Zsh prompt expansion syntax
    PS1="%B%{$fg[cyan]%}%u%b >%{$fg[red]%}>%B%(?.%{$fg[cyan]%}.%{$fg[cyan]%})>%{$reset_color%}%b "
    RPROMPT="$(insert-mode)"
    else
        PS1="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[red]%}>%B%(?.%{$fg[cyan]%}.%{$fg[cyan]%})>%{$reset_color%}%b "
        RPROMPT="$(insert-mode)"
    fi
}
function set-prompt () {
    case ${KEYMAP} in
      (vicmd)      VI_MODE="$(normal-mode)" ;;
      (main|viins) VI_MODE="$(insert-mode)" ;;
      (*)          VI_MODE="$(insert-mode)" ;;
    esac
    if [[ "$PWD" == "$HOME" ]]; then
     # Zsh prompt expansion syntax
    PS1="%B%{$fg[cyan]%}%u%b >%{$fg[red]%}>%B%(?.%{$fg[cyan]%}.%{$fg[cyan]%})>%{$reset_color%}%b "
    RPROMPT="%B%F{red}$VI_MODE"
    else
        PS1="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[red]%}>%B%(?.%{$fg[cyan]%}.%{$fg[cyan]%})>%{$reset_color%}%b "
        RPROMPT="%B%F{red}$VI_MODE"
    fi

    # PS1="%{$terminfo_down_sc$VI_MODE$terminfo[rc]%}%~ $ "
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}
preexec () { print -rn -- $terminfo[el]; }

zle -N zle-line-init
zle -N zle-keymap-select


# remove delay when entering NORMAL mode
KEYTIMEOUT=20


# "jj" enters NORMAL mode
bindkey -M viins 'jj' vi-cmd-mode

# remove a word
bindkey '^w' backward-kill-word

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip



