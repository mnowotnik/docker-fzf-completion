#! /usr/bin/bash

#{{content}}

_fzf_complete_docker() {
	local cur prev words cword
	_get_comp_words_by_ref -n : cur prev words cword

    if ! type _docker > /dev/null 2>&1; then
        _completion_loader "$@"
        complete -F _fzf_complete_docker -o default -o bashdefault docker
    fi

	local counter=1
	while [ $counter -lt $cword ]; do
		case "${words[$counter]}" in
			run)
                _fzf_complete_docker_run "$@"
                return
            ;;
			exec|rm)
                _fzf_complete_docker_exec "$@"
                return
            ;;
            save|load|push|pull|tag|rmi)
                _fzf_complete_docker_common "$@"
                return
            ;;
		esac
		(( counter++ ))
	done
    _fzf_handle_dynamic_completion docker "$@"
}

export _fzf_orig_completion_docker=_docker
complete -F _fzf_complete_docker -o default -o bashdefault docker

