# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository containing configuration for development tools on macOS.

## Repository Structure

- `nvim/` - LazyVim-based Neovim config. Plugins in `lua/plugins/`, core config in `lua/config/`
- `claude/` - Claude Code settings and plugin config (symlinked to `~/.claude`)
- `cursor/`, `vscode/`, `windsurf/` - VS Code-family editor settings and keybindings
- `kanata/` - Keyboard remapping config (run with `sudo kanata -c ~/dotfiles/kanata/kanata.kbd`)
- `karabiner/` - Karabiner-Elements config (using Goku/edn format)
- `aerospace/` - Aerospace window manager config
- `kitty/`, `ghostty/` - Terminal emulator configs
- `fish/` - Fish shell config
- `.zshrc` - Zsh config with Oh My Zsh, nvm auto-switching, and starship prompt

## Symlink Pattern

These configs are typically symlinked to their expected locations (e.g., `~/.config/nvim` → `~/dotfiles/nvim`).

## Key Aliases (from .zshrc)

- `dotf` - Open dotfiles in Cursor
- `kb` - Start kanata keyboard remapping
- `lg` - lazygit
- `nv` / `vim` / `vi` - nvim
