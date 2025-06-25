# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH


# Add pnpm global bin directory to PATH
export PATH="/Users/ddaniel/Library/pnpm:$PATH"
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh


# --- Environment Variables ---
export PATH="/opt/homebrew/bin:$PATH"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"
# export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$PNPM_HOME:$BUN_INSTALL/bin:/Applications/Postgres.app/Contents/Versions/latest/bin"

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
alias nr='npm run'
alias nv='nvim'
alias lg='lazygit'
alias com='git commit -m'
alias comc='git commit -m "chore:"
alias comfe='git commit -m "feat:"
alias comfi='git commit -m "fix:"
alias comd='git commit -m "docs:"
alias comp='git commit -m "perf:"
alias comr='git commit -m "refactor:"
alias gc='git checkout'
alias gcb='git checkout -b'
alias gbd='git branch -D'
alias gm='git merge'
alias ga='git add'
alias gfo='git fetch origin --prune'


antidote load
alias claude="/Users/ddaniel/.claude/local/claude"
