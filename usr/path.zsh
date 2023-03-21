# Personal scripts
if [ -d "$HOME/Personal Library/bin/downloads:$PATH" ]; then
    export PATH="$HOME/Personal Library/bin/downloads:$PATH"
    export PATH="$HOME/Personal Library/bin/personal:$PATH"
fi

# Homebrew
if [[ $(uname -s) == "Darwin" ]] then;
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/sbin:$PATH"
fi

# Nvim lsp servers
export PATH="$HOME/.local/share/nvim/lsp_servers:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Coursier https://get-coursier.io/
export PATH="$PATH:/Users/a.ragulin/Library/Application Support/Coursier/bin"

# C/C++/Rust
export PATH="/usr/local/opt/llvm/bin:$PATH"
