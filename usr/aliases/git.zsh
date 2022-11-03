alias gf="git add .; git commit; git push"

if [[ "$OSTYPE" == "darwin"* ]]
then
  alias gi="ssh-add --apple-use-keychain  '$HOME/.ssh/github'; ssh-add --apple-use-keychain '$HOME/.ssh/gitlab'"
else
  alias gi="ssh-add '$HOME/.ssh/github'; ssh-add '$HOME/.ssh/gitlab'"
fi

alias gssh="eval 'ssh-agent -s'; ssh-add ~/.ssh/id_ed25519"
