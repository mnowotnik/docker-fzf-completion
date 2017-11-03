#! /usr/bin/zsh
_fzf_complete_docker_run_post() {
    awk '{print $1":"$3}'
}

_fzf_complete_docker_run () {
    _fzf_complete '-m --header-lines=1' "$@" < <(
        docker images
    )
}

_fzf_complete_docker_common_post() {
    awk -F"\t" '{print $1}'
}

_fzf_complete_docker_common () {
    _fzf_complete '--reverse -m' "$@" < <(
        docker images --format "{{.Repository}}:{{.Tag}}\t {{.ID}}"
    )
}

_fzf_complete_docker_exec_post() {
    awk '{print $NF}'
}

_fzf_complete_docker_exec () {
    _fzf_complete '-m --header-lines=1' "$@" < <(
        docker ps -a
    )
}

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
        exec)
            _fzf_complete_docker_exec "$@"
            return
        ;;
        save|load|push|pull|tag)
            _fzf_complete_docker_common "$@"
            return
        ;;
    esac
}

