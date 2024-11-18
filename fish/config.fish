fish_vi_key_bindings
fish_vi_cursor
set -g theme_display_date no
set -g fish_greeting

# Terminal
alias dmm="kitty +kitten themes --reload-in=all Tokyo Night;and theme_dracula;and fig theme catppuccin"
alias lmm="kitty +kitten themes --reload-in=all Tomorrow;and theme_tomorrow;and fig theme light"
alias dm="theme_dracula"
alias lm="theme_tomorrow"


# Configs
alias dotf="cd ~/dotfiles;and nvim"
alias gitc="nvim ~/.gitconfig"
alias lazyc="cd ~/Library/Application\ Support/lazygit/;and nvim"

alias kittyupdate="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias kittyrestart="kitty +kitten restart"
alias disable-spotlight="sudo mdutil -i off"
alias enable-spotlight="sudo mdutil -i on"

alias cc="clear"

# Directories
alias cdc="cd ~/code/"
alias cdm="cd ~/code/metta"
abbr cdr "cd ~/code/reflect/"
alias cdl="cd ~/dev/l3/"
alias cdll="cd ~/dev/l3/layer3/"
alias cdrr="cd ~/code/reflect/reflect/"
alias cdre="cd ~/code/reflect/reflect-editor/"
alias cdo="cd ~/code/oliver/astro/astro-nomy/"
alias cdmt="cd ~/code/metta/mettatron"
alias cpwd="pwd | tr -d '\n' | pbcopy"
# alias shad="npx shadcn-ui@latest add"

# Applications
alias c="open -a Cursor ."
alias s="windsurf ."
abbr y yarn
abbr yz yazi
abbr p pnpm
abbr n npm
abbr nr "npm run"
abbr nv nvim

alias simopen="xcrun simctl openurl booted"

abbr shadd "pnpm dlx shadcn@latest add"

# Git

## convcnetional commits
abbr lg lazygit
abbr com 'git commit -m'
abbr comc "git commit -m \"chore:"
abbr comfe "git commit -m \"feat:"
abbr comfi "git commit -m \"fix:"
abbr comd "git commit -m \"docs:"
abbr comp "git commit -m \"perf:"
abbr comr "git commit -m \"refactor:"
alias sq="git commit -am 'squish me'"
## branches
abbr gc "git checkout"
abbr gcb "git checkout -b"
abbr gbd "git branch -D"
abbr gm "git merge"
abbr ga "git add"
abbr gfo "git fetch origin --prune"
alias gcb="git checkout -b"
alias pull="git pull origin"
alias push="git push origin HEAD"
alias gitb="git branch"
alias gs="git status"
alias grv="git remote -v"
alias mas="git checkout master"
alias mai="git checkout main"
alias grc="git rebase --continue"
alias grm="git rebase -i main"
alias grd="git rebase -i development"
alias gmm="git merge master"
alias gmd="git merge dev"
alias lol="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias lola="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias vim="nvim"
alias vi="nvim"

# System
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles -bool true ; killall Finder'
alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles -bool false ; killall Finder'

# Initialize zoxide
zoxide init fish | source

# Postgres
set -Ux fish_user_paths "/Applications/Postgres.app/Contents/Versions/latest/bin" $fish_user_paths

# Golang configurations
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x GOROOT (brew --prefix golang)/libexec
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

# rbenv
status --is-interactive; and rbenv init - fish | source


if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
end

source /Users/ddaniel/.docker/init-fish.sh || true # Added by Docker Desktop

# pnpm
set -gx PNPM_HOME /Users/ddaniel/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
