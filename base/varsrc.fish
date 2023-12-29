set -gx BAT_THEME           'Nord'
set -gx FZF_DEFAULT_COMMAND 'find . -type f -not -path "*/node_modules/*" -not -path "*/.git/*" | sed "s/^\.\///"'

set -gx EDITOR "vim"

set -gx PATH "$PATH:$HOME/.local/share/pnpm"
set -gx PATH "$PATH:$HOME/.local/share/AUniter"
set -gx PATH "$PATH:$HOME/go/bin"
set -gx PATH "$PATH:$HOME/Desktop/software/scripts"  #personal scripts
