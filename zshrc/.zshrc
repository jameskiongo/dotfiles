 eval "$(starship init zsh)"


 # plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

EZA_CONFIG_DIR="~/.config/eza/theme.yml"
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"


# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# zenbones dark (custom bg/fg) — fzf theme
export FZF_DEFAULT_OPTS="
  --color=fg:#b4bdc3,bg:#1c1a18,hl:#c9a67d
  --color=fg+:#c9d1d6,bg+:#29251f,hl+:#d9b992
  --color=info:#8fa8ac,prompt:#b4877a,pointer:#b4877a
  --color=marker:#92a17c,spinner:#a98cae,header:#7f9aa6
  --color=border:#4a4540,separator:#4a4540,scrollbar:#4a4540
  --color=preview-fg:#b4bdc3,preview-bg:#211e1b,gutter:#1c1a18
  --color=query:#b4bdc3,label:#867a74
"
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg='#867a74',bold
ZSH_HIGHLIGHT_STYLES[command]=fg='#b4bdc3',bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg='#b4bdc3'
ZSH_HIGHLIGHT_STYLES[function]=fg='#b4bdc3'
ZSH_HIGHLIGHT_STYLES[alias]=fg='#b4bdc3'

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# ---- Zoxide (better cd) ----
alias cd="z"
alias n="nvim"
alias dev="npm run dev"
alias runserver="python3 manage.py runserver"
alias migrate="python3 manage.py migrate"
alias makemigrations="python3 manage.py makemigrations"
alias rmd="rm -rf"
alias env="source env/bin/activate"
alias la="ls -a"
alias ta="tmux attach"
alias ls="eza --color=always --icons=always"
alias spotify="spotify_player"
alias cal="calcure"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
export EDITOR=nvim

. "$HOME/.local/bin/env"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/go/bin
autoload -Uz compinit && compinit
bindkey -e

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
