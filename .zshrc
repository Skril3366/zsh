autoload -U colors && colors

export LANG=en_US:UTF-8
export BROWSER="firefox"
export BSTINPUTS="/Users/alexandrragulin/Library/Application Support/MiKTeX/texmfs/install/bibtex/bst/ieeetran"
export CPLUS_INCLUDE_PATH="/usr/local/Cellar/gcc/11.2.0_3:/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include"
export EDITOR="nvim"
export EDITOR="nvim"
export PERSONAL_LIBRARY=/Users/alexandrragulin/Personal\ Library
export TERM="xterm-256color"
export TERMINAL="alacritty"
export ZK_NOTEBOOK_DIR="/Users/alexandrragulin/Personal Library/Obsidian/General/"

# Needed for language server for java
#export JDTLS_HOME="~/.config/nvim/LSP/jdtls"

#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/"
# LC_ALL='C'

bindkey -v

# Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search


# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history
setopt appendhistory


# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

export PATH="$PATH:/Users/alexandrragulin/Personal Library/bin/downloads"
export PATH="$PATH:/Users/alexandrragulin/Personal Library/bin/personal"
export PATH="$PATH:/usr/local/bin" # do not move it
export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:~/.local/share/nvim/lsp_servers"
# MacPorts Installer
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Aliases

alias -g ...='../..'
alias -g ....='../../..'

fcd(){
cd "$(find . -type d | fzf)"
}
openf(){
open "$(find . -type f | fzf)"
}
pdf(){
open "$(find . -type f |ggrep '\.pdf$' | fzf)"
}
url2file(){
	echo "$(find . -type f | fzf | xargs -I {} curl -F'file=@{}' http://0x0.st)" | tr -d "\n"| pbcopy
}
# alias ls="ls -GFh"
alias graveyard="find /tmp/ -type f| ggrep 'graveyard-'"
alias hist="cat ~/.config/zsh/history | sort | uniq|  fzf"
# alias mdl="pbpaste | xargs -I {} spotdl '{}'"
alias mdl="pbpaste | xargs -I {} yt-dlp --format bestaudio --audio-format mp3 --extract-audio --output '%(playlist_index)s. %(title)s.%(ext)s' '{}'"
alias vdl="pbpaste | xargs -I {} yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 '{}' -o '%(title)s.%(ext)s' "
alias update="brew update; brew upgrade;
nvim -c :PackerSync -c :q!;
nvim -c :TSUpdateSync -c :q!"
alias c="cd ~/.config"
alias picard="open * -a MusicBrainz\ Picard"
alias d="cd /Users/alexandrragulin/Desktop"
alias doc="cd /Users/alexandrragulin/Documents"
alias down="cd /Users/alexandrragulin/Downloads"
alias fdd="fd -t d"
alias ff="fd | fzf"
alias file_find="fd | fzf"
alias gf="git add .; git commit; git push"
# alias gi="ssh-add ~/Personal\ Library/github/github"
alias gi="ssh-add --apple-use-keychain ~/.ssh/id_ed25519"
# alias grep="ggrep"
alias gssh="eval 'ssh-agent -s'; ssh-add ~/.ssh/id_ed25519"
alias ll="ls -GFlah"
alias async="msync;osync;libsync"
alias msync="sudo rsync -auvP --delete /Volumes/Music/ /Volumes/Storage/Media/Music/"
alias osync="sudo rsync -auvP --delete ~/Personal\ Library/Obsidian/ /Volumes/Storage/Personal\ Library/Obsidian"
alias libsync="sudo rsync -auvP --delete ~/Personal\ Library/ /Volumes/Storage/Personal\ Library/"
# alias obsdaily="~/Personal Library/Obsidian/General/scripts/date.sh > '$(find ~/Personal\ Library/Obsidian/General/ | ggrep "Daily Notes MOC\.md")' "
alias zc="nvim /Users/alexandrragulin/.config/zsh/.zshrc"
alias v="nvim"
# alias h="cd ~"
alias ip="curl ifconfig.me"
alias vf="fd | fzf | xargs -I {} nvim {}"
alias o="cd ~/Personal Library/Obsidian/General/"
#alias pip="pip3"
alias pipUpdate="pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U"
#alias redpdf="gs -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf"
#alias todo="/usr/local/bin/todotxt-machine /Users/alexandrragulin/Documents/Obsidian/ToDoLists/todo.txt"
#alias tree="tree -N"
alias zconf="nvim ~/.config/.zshrc"
alias eng="cd ~/Documents/Inno/EAP"
alias hideicons="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias showicons="defaults write com.apple.finder CreateDesktop true; killall Finder"
alias todo="nvim ~/Personal\ Library/Org/Phone.org"
alias notes="find ~/Personal\ Library/Obsidian/General | fzf | xargs -I {} nvim '{}'"
alias coverformat='find .| ggrep ".jpg" | xargs -I {} convert {} -resize 500x500 "{}"'
alias conf='nvim ~/.config/'
alias snip='cd ~/.local/share/nvim/site/pack/packer/start/friendly-snippets/snippets'

#source /usr/local/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting

# Plugins
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# source "/Users/alexandrragulin/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(zoxide init zsh)"

fpath+=($HOME/.config/zsh/plugins/pure)

autoload -U promptinit; promptinit
prompt pure


# autoload -Uz vcs_info
# precmd () { vcs_info }
# # zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)'
# zstyle ':vcs_info:git*' formats '  %b'

# setopt PROMPT_SUBST
# PROMPT='%F{red}%~${vcs_info_msg_0_}>%f '
