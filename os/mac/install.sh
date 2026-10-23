#!/usr/bin/env bash
# Install Homebrew (if missing) and everything in the Brewfile. Safe to re-run.

set -e
BREWFILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/Brewfile"

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Fresh installs aren't on PATH yet (Apple Silicon: /opt/homebrew, Intel: /usr/local)
for prefix in /opt/homebrew /usr/local; do
  [[ -x "$prefix/bin/brew" ]] && eval "$("$prefix/bin/brew" shellenv)" && break
done

# --no-upgrade: only install what's missing; upgrades are a separate, deliberate `brew upgrade`
if brew bundle check --file="$BREWFILE" --no-upgrade &>/dev/null; then
  echo "Brewfile dependencies already satisfied"
else
  brew bundle install --file="$BREWFILE" --no-upgrade
fi
