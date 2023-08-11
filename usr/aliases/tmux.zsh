tf() {
  session=$(tmux ls | sed "s/:.*//" | fzf)
  tmux new-session -A -s "$session"
}
