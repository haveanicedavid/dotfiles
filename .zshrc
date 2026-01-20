
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"



# --- PATH Setup ---
export PATH="/opt/homebrew/bin:$PATH"

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
plugins=(git nvm)
source $ZSH/oh-my-zsh.sh

# --- NVM Auto-Switching ---
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    local requested_version="$(cat "${nvmrc_path}")"

    if [ "$nvmrc_node_version" = "N/A" ]; then
      echo "\033[1;33m📦 Installing Node.js v${requested_version}...\033[0m"
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      echo "\033[1;32m🔄 Switching to Node.js v${requested_version}\033[0m"
      nvm use
      echo "\033[1;36m✓ Now using $(node -v) (npm v$(npm -v))\033[0m"
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "\033[1;35m↩️ Reverting to default Node version\033[0m"
    nvm use default
    echo "\033[1;36m✓ Now using $(node -v)\033[0m"
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# --- Prompt & Plugins ---
eval "$(starship init zsh)"
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# --- Terminal Title (just folder path, no username) ---
function set_title() { print -Pn "\e]0;%~\a" }
add-zsh-hook precmd set_title

# --- Environment Variables ---
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"

# --- Aliases ---
# Terminal themes
alias lmm='kitty +kitten themes --reload-in=all Tomorrow && theme_tomorrow && fig theme light'

# Configs
alias dotf='cd ~/dotfiles && open -a Cursor .'
alias gitc='nvim ~/.gitconfig'
alias lazyc='cd ~/Library/Application\ Support/lazygit/ && nvim'
alias kittyupdate='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias kittyrestart='kitty +kitten restart'
alias disable-spotlight='sudo mdutil -i off'
alias enable-spotlight='sudo mdutil -i on'
alias cc='clear'

# Directories
alias cdc='cd ~/code/'
alias cdm='cd ~/code/metta'
alias cdms='cd ~/code/metta/extension/mettatate/mettatate-sidepanel/'
alias cdl='cd ~/dev/l3/'
alias cdll='cd ~/dev/l3/layer3/'
alias cdi='cd ~/dev/l3/illa'
alias cdk='cd ~/code/kaizen/kaizen-mobile'
alias cdmt='cd ~/code/metta/mettatron'
alias cpwd='pwd | tr -d "\n" | pbcopy'

# Applications
alias c='cursor .'
alias s='windsurf .'
alias mig='npm run db:migrate'
alias simopen='xcrun simctl openurl booted'

# Git
alias sq="git commit -am 'squish me'"
alias pull='git pull origin'
alias push='git push origin HEAD'
alias gitb='git branch'
alias gs='git status'
alias grv='git remote -v'
alias mas='git checkout master'
alias mai='git checkout main'
alias grc='git rebase --continue'
alias grm='git rebase -i main'
alias grd='git rebase -i development'
alias gmm='git merge master'
alias gmd='git merge dev'
alias lol='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias lola='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias vim='nvim'
alias vi='nvim'

# System
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles -bool true ; killall Finder'
alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles -bool false ; killall Finder'

# --- Abbreviations (Fish abbr equivalents) ---
# Use zsh-abbr or zsh-autosuggestions for true abbr-like behavior
# Otherwise, use aliases for simple cases
alias y='yarn'
alias yz='yazi'
alias p='pnpm'
alias n='npm'
alias b='bun'
# alias nr='npm run'
alias br='bun run'
alias nv='nvim'
alias lg='lazygit'
alias com='git commit -m'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gbd='git branch -D'
alias gm='git merge'
alias ga='git add'
alias gfo='git fetch origin --prune'
alias shadd="pnpm dlx shadcn@latest add"

# Start kanata
alias kb="sudo kanata -c ~/dotfiles/kanata/kanata.kbd"


antidote load

[ -s "/Users/ddaniel/.bun/_bun" ] && source "/Users/ddaniel/.bun/_bun"
export PATH="$BUN_INSTALL/bin:$PNPM_HOME:$HOME/.antigravity/antigravity/bin:$PATH"

alias clauto="claude --dangerously-skip-permissions"



# Auto-enable Kiro inline suggestions in Ghostty
[[ "$TERM_PROGRAM" = "ghostty" ]] && command -v kiro-cli &>/dev/null && kiro-cli inline enable &>/dev/null


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
