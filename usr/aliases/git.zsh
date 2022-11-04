alias gf="git add .; git commit; git push"
alias gi="ssh-add --apple-use-keychain  '$HOME/.ssh/github'; ssh-add --apple-use-keychain '$HOME/.ssh/gitlab'"
alias gssh="eval 'ssh-agent -s'; ssh-add ~/.ssh/id_ed25519"

function gup {
  for c in "${configs[@]}"; do
    echo "Updating $c"
    pull_rebase "$HOME/$c"
  done
}

configs=(
  "/.config/nvim"
  "/.config/alacritty"
  "/.config/zsh"
  "/.config/yabai"
  "/.config/skhd"
  )



function pull_rebase {
  DIR="$(pwd)"
  cd "$1"
  git add .
  git stash
  git pull --rebase
  git stash pop
  git submodule update --recursive
  git reset
  cd "$DIR"
}
