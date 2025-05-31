alias -g ...='../..'
alias -g ....='../../..'

fcd(){
cd "$(find . -type d | fzf)"
}
openf(){
open "$(find . -type f | fzf)"
}
pdf(){
open "$(find . -type f |grep '\.pdf$' | fzf)"
}

alias fdd="fd -t d"
alias ff="find . -type f -name"
alias file_find="fd | fzf"

alias ll="ls -Flah"
