# Useful defs
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/exports.zsh"
source "$HOME/.zsh/functions.zsh"

source $HOMEBREW_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_ROOT/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOMEBREW_ROOT/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_ROOT/share/powerlevel10k/powerlevel10k.zsh-theme

# Cross Desktop Group specification
# https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_CONFIG_HOME="$HOME/.config"

# spack.io
export SPACK_ROOT="$HOME/spack"
source $SPACK_ROOT/share/spack/setup-env.sh
# brew.sh
eval "$(brew shellenv)"

# Julia
export PATH=$PATH:$HOME/.juliaup/bin

# avoid clobbering for safety; override behavior with >|
set -o noclobber  

# starship.rs setup using zsh shell
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$HOME/.starship/cache"
eval "$(starship init zsh)"
