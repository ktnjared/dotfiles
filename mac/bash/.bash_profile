# .bash_profile for macOS 11 Big Sur

#### Programmable completion for Bash 4.2+
# https://github.com/scop/bash-completion
# 
# brew install bash-completion@2
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#### Aliases

### Flags
alias mkdir='mkdir -p'

### Navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias 1up='cd ..'
alias 2up='cd ../../'
alias 3up='cd ../../../'
alias 4up='cd ../../../../'
alias cd..='cd ..'

### Replacements 

## cat --> bat
# https://github.com/sharkdp/bat
alias cat='bat'

## find --> fd
# https://github.com/sharkdp/fd
alias find='fd'

## grep --> ripgrep
# https://github.com/BurntSushi/ripgrep
alias grep='ripgrep'

## ls --> exa
# https://the.exa.website
alias ls='exa'
alias ll='exa -lhb'
alias la='exa -lhba'
alias ld='exa -lhaD'
alias lt='exa -al --tree --level=2'

## top --> ytop
# https://github.com/cjbassi/ytop
alias top='ytop'

#### PATH Appends

### bashtop
export PATH="/Users/jared/code/bashtop:$PATH"

### Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"