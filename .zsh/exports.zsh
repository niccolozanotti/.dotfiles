# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export XDG_CONFIG_HOME="$HOME/.config"
export SPACK_ROOT=$HOME/spack

#GPG
export GPG_TTY=$(tty)


## PYTHON
export PYTHON3_HOMEBREW="$HOMEBREW_ROOT/bin/python3"
export PIP3_HOMEBREW="$HOMEBREW_ROOT/bin/pip3"

# uv-installed Python version paths
export UV_PYTHON_ROOT="$HOME/.local/share/uv/python"
export PYTHON3_9="$UV_PYTHON_ROOT/cpython-3.9.21-macos-aarch64-none/bin/python3"
export PYTHON3_10="$UV_PYTHON_ROOT/cpython-3.10.16-macos-aarch64-none/bin/python3"
export PYTHON3_11="$UV_PYTHON_ROOT/cpython-3.11.11-macos-aarch64-none/bin/python3"
export PYTHON3_12="$UV_PYTHON_ROOT/cpython-3.12.9-macos-aarch64-none/bin/python3"
export PYTHON3_13="$UV_PYTHON_ROOT/cpython-3.13.1-macos-aarch64-none/bin/python3"
export PIP3_9="$UV_PYTHON_ROOT/cpython-3.9.21-macos-aarch64-none/bin/pip3"
export PIP3_10="$UV_PYTHON_ROOT/cpython-3.10.16-macos-aarch64-none/bin/pip3"
export PIP3_11="$UV_PYTHON_ROOT/cpython-3.11.11-macos-aarch64-none/bin/pip3"
export PIP3_12="$UV_PYTHON_ROOT/cpython-3.12.9-macos-aarch64-none/bin/pip3"
export PIP3_13="$UV_PYTHON_ROOT/cpython-3.13.1-macos-aarch64-none/bin/pip3"

# ICCS-related work
export ICCS="$HOME/Documents/iccs"
export FTORCH="$ICCS/FTorch"
export FTORCH_PREFIX="$ICCS/libs/bin/FTorchbin/lib/cmake/FTorch/"
export LIBTORCH_PREFIX="$ICCS/libs/libtorch/share/cmake/Torch/"
export PFUNIT_PREFIX="$ICCS/libs/PFUNIT-4.12/cmake/"
