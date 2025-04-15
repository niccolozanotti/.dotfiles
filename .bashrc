# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source aliases and exports
if [ -f ~/.bash/aliases.sh ]; then
           . ~/.bash/aliases.sh
   fi
if [ -f ~/.bash/exports.sh ]; then
         . ~/.bash/exports.sh
 fi	 
if [ -f ~/.bash/functions.sh ]; then
         . ~/.bash/functions.sh
 fi	 
# User specific aliases and functions
. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
. ~/spack/share/spack/setup-env.sh
spack load lazygit

