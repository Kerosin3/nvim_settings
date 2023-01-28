#
# modules
#
# quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

#
# directory
#
#Make cd push the old directory onto the directory stack. 
setopt auto_pushd
#Don’t push multiple copies of the same directory onto the directory stack. 
setopt pushd_ignore_dups
# expand ~
setopt auto_name_dirs
#
# History

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
# not execute command from history instant
setopt hist_verify
# not add commandline with space to history
setopt hist_ignore_space
# ignore duplication command history list
setopt hist_ignore_dups

#
# other options
#
# disable correction
unsetopt correct_all 
# shut up
setopt no_beep
#Perform implicit tees or cats when multiple redirections are attempted (see Redirection). 
setopt multios
# show more info about jobs
setopt long_list_jobs


# highlight on tab 
zstyle ':completion:*' menu select

# reclaim strg+s
stty stop undef
stty start undef

#
#

bindkey -v
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^e' autosuggest-accept
bindkey '^ ' autosuggest-execute
# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

zle -N edit-command-line
autoload -Uz edit-command-line
bindkey -M vicmd 'e' edit-command-line

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudo $EDITOR $LBUFFER"
    elif [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey '^s' sudo-command-line
bindkey -M vicmd 's' sudo-command-line
