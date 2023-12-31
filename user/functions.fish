function tt -d 'touch command that created the parent directories if necessary'
    env -S "touch $argv" &|
        sed "s/^.*'\(.*\)'.*/\1/" |
        xargs -I{} -P12 bash -c 'mkdir -p $(dirname {})'

    env -S "touch $argv"
end

function clean_common_file_content -d 'removes # comments and blank lines'
    sed 's/  */ /g;s/^ *//;s/ *#.*$//;/^ *$/d' "$argv[1]" |
        awk '{
            if (sub(/ *\\\ *$/, ""))
                printf "%s ", $0;
            else
                print $0;
        }'
end

function __get_prompt_for_bashrc -d 'cleaned version of the bash prompt script'
    set -l BASH_PROMPT "$HOME/.config/fish/bash/prompt.bash"

    clean_common_file_content "$BASH_PROMPT"
end

function __get_aliases_for_bashrc -d 'print all bashrc aliases (no repeat)'
    set -l BASH_ALIASRC "$HOME/.config/fish/bash/aliasrc.bash"
    set -l FISH_ALIASRC "$HOME/.config/fish/user/aliasrc.fish"

    set -l sed_delete_matches (clean_common_file_content "$BASH_ALIASRC" |
        sed 's/alias  *//;s/=.*//;/[^a-zA-Z0-9]/d' |
        xargs -I{} printf '/^alias {}/d;/^abbr {}/d;')

    clean_common_file_content "$BASH_ALIASRC"  #display exclusive for bash

    clean_common_file_content $FISH_ALIASRC |
        sed "$sed_delete_matches;s/abbr/alias/" |
        awk '{
            printf "%s %s=", $1, $2;

            for (i = 3; i <= NF; ++i)
                printf i == 3 ? "%s" : " %s", $i;
            printf "\n";
        }'
end

function __get_variables_for_bashrc -d 'print all variables in bashrc format'
    set -l VARSRC "$HOME/.config/fish/user/varsrc.fish"

    clean_common_file_content "$VARSRC" |
        awk '{
            printf "export %s=", $3;

            for (i = 4; i <= NF; ++i)
                printf i == 4 ? "%s" : " %s", $i;
            printf "\n";
        }'
end

function generate_bash_config -d 'print a bashrc based on the fish config'
    __get_variables_for_bashrc
    __get_aliases_for_bashrc
    __get_prompt_for_bashrc
end
