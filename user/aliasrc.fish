alias r  'rm -rf'
alias g  'git'
alias n  'nvim'
alias v  'vim'
alias e  'exit'
alias f  'ranger'
alias t  'tmux'
alias ct 'mkdir /tmp/tmp.kevin; cd /tmp/tmp.kevin'
alias md 'mkdir -vp'
alias cp 'cp -r'

alias fzf 'fzf --preview "batcat --color=always --style=numbers              \
                                 --line-range=:500 {}"                       \
               --ansi                                                        \
               --border sharp                                                \
               --margin 10%                                                  \
               --padding 5%                                                  \
               --info inline                                                 \
               --prompt "   "                                               \
               --pointer "->"                                                \
               --color "bg+:-1,pointer:green,fg+:green,hl:yellow,border:gray"'

alias grep 'grep --colour=auto'
alias bat  'batcat'
alias tree "tree --dirsfirst -aF -I .git -I node_modules -I target \
                 -I .mypy_cache -I __pycache__"

alias ll  'exa -lam --no-user --time-style long-iso --group-directories-first \
               -s extension --icons'
alias l   'exa -lm --no-user --time-style long-iso --group-directories-first \
               -s extension --icons'

abbr update    'sudo apt update && sudo apt upgrade'
abbr uninstall 'sudo apt purge --autoremove'
abbr install   'sudo apt install --no-install-recommends'
abbr orphans   'sudo apt autoremove'

alias tf 'tmuxifier'

abbr py       'python3'
abbr pip      'python3 -m pip'
abbr pyserver 'python3 -m http.server 8080'
abbr pt       'poetry'
abbr ptr      'poetry run'

abbr ard-comp      'arduino-cli compile -u -b arduino:avr:uno -p /dev/ttyUSB0'
abbr ard-ls        'arduino-cli board list'
abbr ard-install   'arduino-cli lib install'
abbr ard-uninstall 'arduino-cli lib uninstall'
abbr ard-new       'arduino-cli sketch new'

abbr exe  'chmod +x'
abbr vf   'vim (fzf)'
abbr nf   'nvim (fzf)'
abbr bf   'bat (fzf)'

alias gcd  'date -I'
alias gcdt 'date \"+%Y-%m-%d_%H-%M\"'
alias gct  'date \"+%H-%M\"'
