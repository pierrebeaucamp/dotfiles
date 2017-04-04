set fish_greeting ''
# fish_vi_mode

for file in ~/.config/fish/conf.d/*.fish
    source $file
end
