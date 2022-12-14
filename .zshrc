#!/bin/bash
autoload -U colors && colors

# Load all user configuration recursively from specified folder
user_config_folder="$HOME/.config/zsh/usr"
user_config=($(find "$user_config_folder" -type f))
for c in "${user_config[@]}"; do
    source "${c}"
done

# Load all the plugins
plugins_folder="$HOME/.config/zsh/plugins"
plugins=(
    "zsh-autocomplete/zsh-autocomplete.plugin.zsh"
    "zsh-autosuggestions/zsh-autosuggestions.zsh"
    "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
)
for p in "${plugins[@]}"; do
    source "$plugins_folder/${p}"
done
fpath+=("$HOME/.config/zsh/plugins/pure")


eval "$(zoxide init zsh)"


autoload -U promptinit; promptinit
prompt pure

export BSTINPUTS="$HOME/Library/Application Support/MiKTeX/texmfs/install/bibtex/bst/ieeetran"
export CPLUS_INCLUDE_PATH="/usr/local/Cellar/gcc/11.2.0_3:/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include"

export BROWSER="firefox"
export EDITOR="nvim"
export TERM="xterm-256color"
export TERMINAL="alacritty"

export PERSONAL_LIBRARY=$HOME/Personal\ Library


# Autocompletion
if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search



# some useful options (man zshoptions)
setopt  extendedglob nomatch menucomplete
unsetopt autocd
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
export zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP


# Aliases


#source /usr/local/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting


# autoload -Uz vcs_info
# precmd () { vcs_info }
# # zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)'
# zstyle ':vcs_info:git*' formats '  %b'

# setopt PROMPT_SUBST
# PROMPT='%F{red}%~${vcs_info_msg_0_}>%f '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [[ -s "/Users/roberto/.sdkman/bin/sdkman-init.sh" ]]
then
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    export PATH="$PATH:/Users/a.ragulin/Library/Application Support/Coursier/bin"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
