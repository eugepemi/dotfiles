export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

# Secrets live outside the repo (chmod 600), never in shell/
[ -f "$HOME/.secrets.zsh" ] && source "$HOME/.secrets.zsh"
