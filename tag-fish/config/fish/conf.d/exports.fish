# Enable Colors
set -x TERM "screen-256color"

# Default editor
set -x EDITOR "nvim"

# Better man pages
set -x MANPAGER "less"
set -x LESS_TERMCAP_md \e\[1\x3B31m

# Locales
set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"

# Masterpasswordapp
set -x MPW_FULLNAME "Pierre Beaucamp"
set -x MPW_FORMAT "none"

# Golang
# bass source /home/pierrebeaucamp/.gvm/scripts/gvm
# set -x GOPATH "/mnt/c/Users/Pierre Beaucamp/Code/go"
# set -x GOBIN "$GOROOT/bin"

# Cabal
# set -x PATH $HOME/.cabal/bin $PATH

# Docker
# set -x DOCKER_HOST tcp://127.0.0.1:2375

# Node
# set -x N_PREFIX $HOME/n
# set -x PATH $N_PREFIX/bin $PATH

# Vagrant
# set -x VAGRANT_WSL_ENABLE_WINDOWS_ACCESS 1
# set -x VAGRNAT_DEFAULT_PROVIDER docker

# Nix
# bass source "/home/pierrebeaucamp/.nix-profile/etc/profile.d/nix.sh"

# Karma
# bass source "/mnt/c/Users/Pierre\ Beaucamp/Code/go/src/github.com/ilovetravel/karma-devops/scripts/local-env.sh"
