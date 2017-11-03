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

