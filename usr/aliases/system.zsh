
alias hideicons="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias showicons="defaults write com.apple.finder CreateDesktop true; killall Finder"

kill_port() {
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
}
