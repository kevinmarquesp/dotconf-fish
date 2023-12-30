set fish_greeting

set -g DESKTOP "$HOME/Desktop"

source "$HOME/.config/fish/user/varsrc.fish"
source "$HOME/.config/fish/user/aliasrc.fish"
source "$HOME/.config/fish/user/keybinds.fish"
source "$HOME/.config/fish/user/functions.fish"

fish_vi_key_bindings  #enambe vi mode

## Daqui pra baixo, só vai ter linhas que outros programas inserem aqui
## --------------------------------------------------------------------

test -f "$HOME/.asdf/asdf.fish" &&
    source "$HOME/.asdf/asdf.fish"

set -gx PNPM_HOME "/home/kevin/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

test -f "/home/kevin/.xmake/profile" &&
    source "/home/kevin/.xmake/profile"
