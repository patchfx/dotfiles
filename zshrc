zmodload zsh/terminfo
zmodload zsh/zle

source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
#antigen bundle vi-mode
antigen bundle brew
antigen bundle git
antigen bundle osx
antigen bundle ruby
antigen bundle rails
antigen bundle zsh-users/zaw

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen-bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme tooky/oh-my-zsh themes/terminalparty-st

# Tell antigen that you're done.
antigen apply

# Customize to your needs...
export PATH=/Users/richard/.bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# zaw
bindkey '^R' zaw-history
bindkey '^G' zaw-git-recent-branches
bindkey -M filterselect '^J' down-line-or-history
bindkey -M filterselect '^K' up-line-or-history
bindkey -M filterselect '^E' accept-search

zstyle ':filter-select:highlight' matched fg=green
zstyle ':filter-select' max-lines 5
zstyle ':filter-select' case-insensitive yes # enable case-insensitive 
zstyle ':filter-select' extended-search yes

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export HISTIGNORE="fg*"
bindkey -s '^f' "fg %-\n"
unsetopt auto_name_dirs
unsetopt correctall
source ~/.aliases

touch ~/.zshmarks && source ~/.zshmarks
function b() {
  echo "hash -d $1=\"`pwd`\"" >> ~/.zshmarks && source ~/.zshmarks
}

# EDITOR
export EDITOR=vim

# direnv hook
eval "$(direnv hook zsh)"
