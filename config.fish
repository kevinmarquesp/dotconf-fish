set fish_greeting

set -g DESKTOP "$HOME/Desktop"

source "$HOME/.config/fish/user/varsrc.fish"
source "$G_FISH_CONFIG/user/aliasrc.fish"

source "$G_FISH_CONFIG/user/keybinds.fish"
source "$G_FISH_CONFIG/user/functions.fish"

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
