#! /usr/bin/zsh

#{{content}}

_fzf_complete_docker() {
    local tokens docker_command
    setopt localoptions noshwordsplit noksh_arrays noposixbuiltins
    # http://zsh.sourceforge.net/FAQ/zshfaq03.html
    # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
    tokens=(${(z)LBUFFER})
    if [ ${#tokens} -le 2 ]; then
        return
    fi
    docker_command=${tokens[2]}
    case "$docker_command" in
        run)
            _fzf_complete_docker_run "$@"
            return
        ;;
        exec|rm)
            _fzf_complete_docker_container "$@"
            return
        ;;
        save|load|push|pull|tag|rmi)
            _fzf_complete_docker_common "$@"
            return
        ;;
    esac
}

