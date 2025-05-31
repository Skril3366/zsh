# Personal scripts
if [ -d "$VAULT/bin/downloads:$PATH" ]; then
    export PATH="$VAULT/bin/downloads:$PATH"
    export PATH="$VAULT/bin/personal:$PATH"
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
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

# C/C++/Rust
export PATH="/usr/local/opt/llvm/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# Haskell
export PATH="$HOME/.ghcup/bin:$PATH"
