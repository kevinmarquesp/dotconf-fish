set fish_greeting

set -g DESKTOP "$HOME/Desktop"

source "$HOME/.config/fish/user/varsrc.fish"
source "$G_FISH_CONFIG/user/aliasrc.fish"

source "$G_FISH_CONFIG/user/keybinds.fish"
source "$G_FISH_CONFIG/user/functions.fish"

function fish_mode_prompt; end  #remove the mode indicator
fish_vi_key_bindings  #enambe vi mode

if [ ! -f "$G_FISH_CONFIG/functions/fisher.fish" ]  #install fisher for me
    mkdir -p "$G_FISH_CONFIG/functions"
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish > "$G_FISH_CONFIG/functions/fisher.fish"

    source "$G_FISH_CONFIG/config.fish"
    fisher install jorgebucaran/fisher
end

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

eval (tmuxifier init - fish)
