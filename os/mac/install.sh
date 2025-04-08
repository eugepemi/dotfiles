# Download HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore packages from Brewfile
brew bundle --file="$DOTFILES/os/mac/Brewfile" --force cleanup

# export brew
brew bundle dump
