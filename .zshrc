# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions ssh-agent github)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# alias
alias ~="~"
alias dev="~/dev"
alias config="~/.config"
alias desktop="~/desktop"
alias downloads="~/downloads"

#zig
export PATH="$HOME/zig:$PATH"
#zig end

# rust
export PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/bin:$PATH"
# rust end

# gopls
export PATH="$HOME/go/bin:$PATH"
# gopls end

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# lua
# exec "</usr/local/Cellar/lua-language-server/3.6.21>/bin/lua-language-server" "$@"
# lua end

# libpq
export PATH="/usr/local/opt/libpq/bin:$PATH"
# libpq end

# bun completions
[ -s "/Users/nik/.bun/_bun" ] && source "/Users/nik/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
