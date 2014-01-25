# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spajus"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git_timer capistrano)

source $ZSH/oh-my-zsh.sh

# Exports
export PATH=/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export EDITOR=vim
export LC_ALL="en_US.UTF-8"

# 10ms for key sequences
export KEYTIMEOUT=1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=~/.dotfiles/bin:$PATH


# Aliases
alias ctags="`brew --prefix`/bin/ctags"
alias retag="ctags -R --exclude=.git --exclude=log --exclude=public --exclude=doc --exclude=app/assets *"
alias gemset="rvm current"
alias wtf='git whatchanged -p --abbrev-commit --pretty=medium'
alias gitlog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias be='bundle exec'
alias brake='bundle exec rake'
alias ssh_unsafe='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'


# Garmin history cleanup
alias garmin-cleanup='rm -rf ~/Library/Application\ Support/Garmin/Devices/3848878505/{Activities,History}/*'

# Functions
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { pstree | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }


# Rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
# Add ~/.extra.zsh with additional stuff that should not be public
source $HOME/.extra.zsh

# No more autocorrect
unsetopt correct
unsetopt correct_all

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/Users/spajus/perl5";
export PERL_MB_OPT="--install_base /Users/spajus/perl5";
export PERL_MM_OPT="INSTALL_BASE=/Users/spajus/perl5";
export PERL5LIB="/Users/spajus/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/spajus/perl5/bin:$PATH";
