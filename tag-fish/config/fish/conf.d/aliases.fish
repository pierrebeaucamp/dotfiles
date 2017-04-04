# Easier navigation: ..., ...., ....., ~ and -
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -="cd -"

# Better LS
alias ls='ls -aFG'
# alias ll="ls -l | awk '{ \
#     k=0; \
#     for (i=0;i<=8;i++) \
#         k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i)); \
#     if (k) \
#         printf(\"%0o \",k); \
#     printf(\" %9s  %3s %2s %5s  %6s  %s %s %s\n\", \$3, \$6, \$7, \$8, \$5, \$9,\$10, \$11); \
# }'"

# Grep with colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo'ed
alias sudo='sudo '

# Package Manager
alias apti='sudo apt-get install --no-install-recommends'
alias aptr='sudo apt-get autoremove --purge'
alias aptu='sudo apt-get update; and sudo apt-get -y upgrade'

# A better copy
alias copy='rsync -WavP --human-readable --progress'

# Clear
alias c='clear'
alias cls='clear'

# Use nvim
alias vi='nvim'
alias vim='nvim'

# WSL
alias open=explorer.exe
