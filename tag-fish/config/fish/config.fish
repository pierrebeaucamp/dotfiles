set fish_greeting ''
# fish_vi_mode

set pure_symbol_prompt "❱"
set pure_symbol_git_down_arrow "↓"
set pure_symbol_git_up_arrow "↑"

if status --is-interactive
  for file in ~/.config/fish/conf.d/{aliases,exports,functions}.fish
    source $file
  end
end

