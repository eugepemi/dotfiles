# zinit config 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit ice wait lucid; zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid; zinit light zsh-users/zsh-completions
zinit ice wait lucid; zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice wait lucid; zinit light Aloxaf/fzf-tab

# Update zinit + plugins
# zinit self-update
# zinit update

# Load completions
autoload -U compinit && compinit

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Keybindings
bindkey -v

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Shell integrations
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Dotfiles
export DOTFILES=/Users/zp2973/dotfiles
source $DOTFILES/shell/main.sh
