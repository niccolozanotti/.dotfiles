# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode reminder  # update reminder
zstyle ':omz:update' frequency 13 # days

HYPHEN_INSENSITIVE="false"
DISABLE_MAGIC_FUNCTIONS="false"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false" # or e.g. "%F{yellow}waiting...%f"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy/mm/dd"
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# plugins=(git)

source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/exports.zsh"
source "$HOME/.zsh/functions.zsh"

homebrew=$(brew --prefix)

export EDITOR=$homebrew/bin/nvim

source $homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $homebrew/share/powerlevel10k/powerlevel10k.zsh-theme


# Ruby
source $homebrew/opt/chruby/share/chruby/chruby.sh
source $homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
