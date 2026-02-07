# .zshrc -- Interactive zsh shell config file
# This is used in a nix-managed system with the following shell configuration
# running shell init commands, defining extra env variables, etc...
# https://git.sr.ht/~niccolozanotti/nix-darwin/tree/main/item/modules/shells.nix

# enable vim bindings for command line editing
bindkey -v

# Tryna be not too messy
source $HOME/.zsh/alias
source $HOME/.zsh/env
source $HOME/.zsh/funcs

# zsh options
ENABLE_CORRECTION="false"
HIST_STAMPS="yyyy/mm/dd"
export CLICOLOR=1
export LS_COLORS="exfxcxdxbxegedabagacadah" #default for ls

############# Shell customization #############
# Enable bash completion
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# These are set by nix-darwin at shell init
source $ZSH_SYNTAX_HIGHLIGHTING_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_AUTOSUGGESTIONS_ROOT/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_FZF_TAB_ROOT/share/fzf-tab/fzf-tab.zsh

# https://specifications.freedesktop.org/basedir/latest/
export XDG_CONFIG_HOME="$HOME/.config"

# starship.rs setup using zsh shell
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export STARSHIP_CACHE=$HOME/.starship/cache
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    # echo "Load starship"
		eval "$(starship init zsh)"
  }

# This is commented since this is enabled at the nix flake level
# source <(fzf --zsh)

############ Package managers #############
# This is commented since this is enabled at the nix flake level
# eval "$(brew shellenv)"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#GPG
export GPG_TTY=$(tty)

# avoid clobbering for safety; override behavior with >|
set -o noclobber  

############## PATH #############
PATH=$HOME/go/bin:$PATH
PATH=$HOME/ext/nvim-macos-arm64/bin:$PATH # nightly build

export PATH

############## fpath #############
fpath=($HOME/completion_zsh $fpath)
