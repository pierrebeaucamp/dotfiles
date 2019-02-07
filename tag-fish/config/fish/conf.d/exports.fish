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

# Some Nix LOCALE fixes
# See https://github.com/NixOS/nixpkgs/issues/8398#issuecomment-186832814
set -e LOCALE_ARCHIVE

# Hledger
set -x LEDGER_FILE "/home/pierrebeaucamp/Nextcloud/Finances/2019.journal"

# Wayland
set -x XDG_SESSION_TYPE "wayland"
set -x GDK_BACKEND "wayland"

