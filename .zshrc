#!/bin/zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="/home/ker0/.oh-my-zsh"
export QT_QPA_PLATFORM="xcb"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_XFT=true
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=$ZSH_CUSTOM_OH

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#export ZSH_CUSTOM='/home/ker0/.oh-my-zsh/custom/plugins'
#plugins=(git
#	zsh-autosuggestions
#	sudo
#	history
#	zsh-syntax-highlighting
#	composer
#	zsh-interactive-cd
#	web-search
#	colored-man-pages
#	last-working-dir
#	)	

#source $ZSH/oh-my-zsh.sh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
ZINIT_H="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/"
if [ ! -d "$ZINIT_H" ]; then
	echo "fetching zinit"
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
	source "${ZINIT_HOME}/zinit.zsh"
fi

#source $OH_MY_ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

if [ -f ~/.bash_profile ]; 
    then . ~/.bash_profile;
    fi
#export ZSH_CUSTOM="/home/ker0/zsh_custom/"
export EDITOR=nvim
export EDITOR=nvim
export NNN_OPTS=H
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
autoload -U colors && colors
alias ls='ls --color=auto'
#export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:*.tar=1;31:*.gz=1;31:*.tbz2=1;31"
#PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}%% "
export NNN_BMS="u:$HOME/;m:/mnt/;e:/etc/"
#PS1="$ [%~~~] "
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias virtualbox="env QT_QPA_PLATFORM=xcb virtualbox"
alias vi=nvim
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"

export cblockchain_conf=/home/ker0/test/prj/sources/logging/zlog.conf

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit load zdharma-continuum/history-search-multi-word
zinit ice blockf
zinit ice depth"1" # git clone depth
zinit light zsh-users/zsh-completions 
zinit ice depth=1
#zinit light jeffreytse/zsh-vi-mode
# extract archive .zip
zinit light alexrochas/zsh-extract
zinit light wfxr/forgit
#misc for themes
setopt promptsubst
zinit wait lucid for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git
if [ "$EUID" -ne 0 ]
  then 
	zinit wait'!' lucid for \
	OMZL::prompt_info_functions.zsh \
	OMZT::gnzh
  else
	zinit wait'!' lucid for \
	OMZL::prompt_info_functions.zsh \
	OMZT::jonathan
  exit
fi
# prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
#zinit light sindresorhus/pure
# ls colors
#
zinit light trapd00r/LS_COLORS
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'

#zinit light jonmosco/kube-ps1
#PROMPT='$(kube_ps1)'$PROMPT
#zinit light 
#zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
#zinit light sindresorhus/pure
#zstyle ':prompt:pure:prompt:*' color '#99ff99'
#zstyle :prompt:pure:path color '#ffff00'
#zstyle :prompt:pure:prompt:error color '#ff0000'
#zstyle :prompt:pure:prompt:success color '#00cc66'
#zstyle :prompt:pure:host color '#ff66ff'
#zstyle :prompt:pure:user color '#ccff33'
#zstyle :prompt:pure:user:root color '#ff0000'
#zstyle :prompt:pure:git:branch color '#99ccff'
#PURE_PROMPT_SYMBOL=❯❯❯   
#
# Download the default profile
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=159'
#eval "$($starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
###################################################################################
# load libaries
###################################################################################
for config_file (${HOME}/.config/zsh/*.zsh); do
    source ${config_file}
done
# local settings to override
###################################################################################
[[ -f ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local
zinit cdreplay -q

