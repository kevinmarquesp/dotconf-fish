#!/usr/bin/env sh

throw() {
    echo "${0} (err) : ${1}"
    exit 1
}

choice() {
    printf "${0} (read) : ${1} [Y/n] "
    stty raw
    local r_user=$(head -c1)
    stty -raw
    printf '\n'

    [ "${r_user}" != 'n' ] && [ "${r_user}" != 'N' ] &&
        return
    return 1
}

OPTIONS="cl"
LONG_OPTIONS="copy,link"
ARGS=$(getopt --options "${OPTIONS}" --longoptions "${LONG_OPTIONS}"\
    --name "${0}" -- "${@}")

[ $? -ne 0 ] && throw "invalid options"
eval "set -- ${ARGS}"
unset OPTIONS LONG_OPTIONS ARGS

FILE_NAME="fish"
opt_to_copy=
opt_targets=

process_target_content() {
    local TARGET="${1}"

    choice "create a backup for ${TARGET}?" &&
        mv "${TARGET}" "${TARGET}.$(date -I).bak"

    rm -rf "${TARGET}"
}

main() {
    for target in ${opt_targets}""
    do
        local TARGET="${target}/${FILE_NAME}"

        [ -e "${TARGET}" ] || [ -L "${TARGET}" ] &&
            process_target_content "${TARGET}"

        if [ "${opt_to_copy}" = true ]
        then
            cp -r "$(pwd)" "${TARGET}"
            eval "rm -rf ${TARGET}/.*"  #remove git and unwanted files
            rm -rf "${TARGET}/install.sh"
            rm -rf "${TARGET}/tags"
        else
            ln -s "$(pwd)" "${TARGET}"
        fi
    done
}

while true
do
    case "${1}" in
        '-c' | '--copy')
            opt_to_copy=true
            shift 1
        ;;
        '-l' | '--link')
            opt_to_copy=false
            shift 1
        ;;
        '--')  #end of flags, start of script paramters
            shift 1
            opt_targets="${HOME}/.config"
            [ ${#} -ne 0 ] && opt_targets="${@}"
            break
        ;;
    esac
done

[ -n "${opt_to_copy}" ]  || throw "is to copy or install? use the flag options"
[ -n "${opt_targets}" ] || throw "target directory wasen't specified"

main
