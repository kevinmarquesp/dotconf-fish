# function filter-and-exec -d 'use peco to filter an output and execute a fish command'
#     argparse 'f/filter=!' 'e/exec=!' 'a/accumulate' 'b/break' -- $argv
#     or return

#     if [ -z "$_flag_f" ] || [ -z "$_flag_e" ]
#         echo '[err] not enougth info provided'
#         return 1
#     end

#     if [ -z "$_flag_a" ]
#         for match in (eval "$_flag_f | peco")
#             [ ! -z "$match" ] && eval (string replace '{}' $match $_flag_e)
#             [ ! -z "$_flag_b" ] && return
#         end
#     else
#         eval (string replace '{}' "($_flag_f | peco)" $_flag_e)
#     end
# end

## tmux and tmuxp related mappings
# bind -M insert \et 'filter-and-exec -bf "ls -1 $SESSIONS/tmuxp" -e "tmuxp load -y (string split -f1 . {})"'            # load a saved session
# bind -M insert \eT 'filter-and-exec -af "ls -1 $SESSIONS/tmuxp" -e "cd $SESSIONS/tmuxp; nvim {}"'                      # select a session to edito
# bind -M insert \ea 'filter-and-exec -bf "tmux ls"               -e "tmux attach -c (string split -f1 : \"{}\")"'       # attach a active tmux session
# bind -M insert \eK 'filter-and-exec -f  "tmux ls"               -e "tmux kill-session -t (string split -f1 : \"{}\")"' # kill a tmux session by selecting it
# bind -M insert \ed 'filter-and-exec -f  "ls -1 $SESSIONS/tmuxp" -e "rm $SESSIONS/tmuxp/{}"'                            # delete a tmuxp session

## vim related mappings
# bind -M insert \ev 'filter-and-exec -bf "ls -1 $SESSIONS/vim" -e "vim -S $SESSIONS/vim/{} -c \"source ~/.vimrc\""' # bind to load a vim session
# bind -M insert \eD 'filter-and-exec -f  "ls -1 $SESSIONS/vim" -e "rm $SESSIONS/vim/{}"'                            # delete a vim session
# bind -M insert \eV 'filter-and-exec -af "ls -1 $SESSIONS/vim" -e "cd $SESSIONS/vim; vim {}"'                       # edit a vim session

function __vi_enter_normal_mode -d 'bind (ctrl) for enter in normal mode'
    if commandline -P
        commandline -f cancel
    else
        set fish_bind_mode default
        commandline -f backward-char force-repaint
    end
end

bind -M insert \cp __vi_enter_normal_mode

# bind -M insert \ef\
#     'read -P "Specify new session name: " name
#     if [ $name != "" ]
#         tmux rename-session -t (tmux display-message -p "#S") "$name"
#         tmuxp freeze --force -yf yaml -o "$SESSIONS/tmuxp/$name.yaml"
#         vim "$SESSIONS/tmuxp/$name.yaml"
#     end'
