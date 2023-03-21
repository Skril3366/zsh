if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
else
  echo "`exa` utility is not installed"
  echo "it can be installed using cargo"
fi
