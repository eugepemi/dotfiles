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
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
# Avoid initializing zoxide if CLAUDECODE is set, as it interferes with the Claude Code CLI
if [[ -z "${CLAUDECODE}" ]]; then
  eval "$(zoxide init --cmd cd zsh)"
fi
eval "$(direnv hook zsh)"

# Dotfiles
export DOTFILES=/Users/eugenio.penalver/dotfiles
source $DOTFILES/shell/main.sh

# Created by `pipx` on 2025-05-21 11:10:50
export PATH="$PATH:/Users/eugenio.penalver/.local/bin"
export PATH="/usr/local/bin:$PATH"

# Added by Antigravity
export PATH="/Users/eugenio.penalver/.antigravity/antigravity/bin:$PATH"

# bun completions
[ -s "/Users/eugenio.penalver/.bun/_bun" ] && source "/Users/eugenio.penalver/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# dcg: warn if hook was silently removed from Claude Code settings
if command -v dcg &>/dev/null && command -v jq &>/dev/null; then
  if [ -f "$HOME/.claude/settings.json" ] && \
     ! jq -e '.hooks.PreToolUse[]? | select(.hooks[]?.command | test("dcg$"))' \
       "$HOME/.claude/settings.json" &>/dev/null; then
    printf '\033[1;33m[dcg] Hook missing from ~/.claude/settings.json — run: dcg install\033[0m\n'
  fi
fi
