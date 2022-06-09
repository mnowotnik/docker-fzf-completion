# docker-fzf-completion 
> DEPRECATED. Use [fzshell](https://github.com/mnowotnik/fzshell) instead.

Extends default docker completion with fzf

<img src="https://raw.githubusercontent.com/Mike-Now/img/master/docker-fzf-completion.gif" width=640>

## Installation
1. Download and install fzf and docker with docker autocompletion
2. Set default FZF trigger to something else beside ** (optionally)

```bash
  export FZF_COMPLETION_TRIGGER='%%'
```

3. Source either `docker-fzf.bash` or `docker-fzf.zsh` depending on your shell.
