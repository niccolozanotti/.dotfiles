#/usr/bin/bash

# gpg signature
export GPG_TTY=$(tty)

export PATH="$HOME/local/bin:$PATH"

export ICCS=$HOME/rds/hpc-work/iccs
export FTORCH=$ICCS/FTorch
export LIBTORCH_PREFIX=$ICCS/libs/libtorch/share/cmake/Torch
export PFUNIT_PREFIX=$ICCS/libs/PFUNIT-4.12/cmake/
