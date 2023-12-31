set -gx BAT_THEME           'Nord'
set -gx FZF_DEFAULT_COMMAND 'find . -type f -not -path "*/node_modules/*" -not -path "*/.git/*" | sed "s/^\.\///"'

set -gx EDITOR "vim"

set -gx PATH "$PATH:$HOME/.local/share/pnpm"
set -gx PATH "$PATH:$HOME/.local/share/AUniter"
set -gx PATH "$PATH:$HOME/go/bin"
set -gx PATH "$PATH:$HOME/Desktop/software/scripts"  #personal scripts
set -gx PATH "$PATH:$HOME/.tmux/plugins/tmuxifier/bin"

set -gx G_FISH_CONFIG "$HOME/.config/fish"
set -gx G_DESKTOP "$HOME/Desktop"
set -gx G_TEMPLATES "$G_DESKTOP/archives/assets/templates"
