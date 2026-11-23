set -g fish_greeting
if status is-interactive
    fastfetch
    # Commands to run in interactive sessions can go here

end
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.luarocks/bin"
