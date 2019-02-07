set fish_greeting ''
# fish_vi_key_bindings

set pure_symbol_prompt "❱"
set pure_symbol_git_down_arrow "↓"
set pure_symbol_git_up_arrow "↑"

if status --is-interactive
  for file in ~/.config/fish/conf.d/{aliases,exports,functions}.fish
    source $file
  end
end

if test (tty) = "/dev/tty1"
  sway
  exit 0
end
