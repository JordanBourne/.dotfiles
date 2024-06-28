# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
#
plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls="colorls"
alias fab="tmuxifier load-session fab"
alias geni="cd ~/Repos/fabric-platform/frontend/ && npm run genIndexes"
alias piper="cd ~/Repos/fabric-devops/ && make proxy"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Check if pyenv is available
if command -v pyenv 1>/dev/null 2>&1; then
    # Pyenv configuration
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
export NVM_DIR=~/.nvm
source "$(brew --prefix nvm)/nvm.sh"

# Python 3.12 path
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
export PATH="$HOME/nvim-macos-arm64/bin:$PATH"
export PATH="$HOME/.config/tmux/.tmuxifier/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

source ~/.config/iterm2/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $(dirname $(gem which colorls))/tab_complete.sh

export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jordanbourne/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jordanbourne/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jordanbourne/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jordanbourne/google-cloud-sdk/completion.zsh.inc'; fi


