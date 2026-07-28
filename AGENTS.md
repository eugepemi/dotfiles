# AGENTS.md

macOS dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot). Symlinks configs from this repo into `~`.

## Layout

| Path | Purpose |
|------|---------|
| `.mac-conf.yml` | dotbot config — defines every symlink and install step |
| `install` | entrypoint: syncs submodules, runs dotbot with `.mac-conf.yml` (macOS only) |
| `config/` | app configs (zsh, git, starship, bat, atuin, ghostty, vscode, zed, karabiner) |
| `shell/` | zsh scripts sourced at startup: `aliases.sh`, `exports.sh`, `functions.sh`, `main.sh` |
| `os/mac/` | `install.sh` + `Brewfile` for Homebrew packages |
| `dotbot/` | dotbot submodule — do not edit |

## Install

```bash
./install
```

Idempotent. Relinks with `relink: true, force: true`.

## Rules for agents

- **Adding a dotfile**: put the source under `config/`, then add a `~/target: config/source` line to the `link:` block in `.mac-conf.yml`. Do not create symlinks by hand.
- **Shell changes**: edit files in `shell/`. `main.sh` sources the others via `$DOTFILES`.
- **Homebrew packages**: edit `os/mac/Brewfile`.
- Never edit anything in `dotbot/` (submodule).
- macOS only — `install` rejects other OSes.
- After editing `.mac-conf.yml`, run `./install` to apply.
