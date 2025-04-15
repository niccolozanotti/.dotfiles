#!/bin/bash

# Function to set up environment for FTorch development
ftorch-mods() 
{
  echo "Purging modules"
  module purge
  echo "Loading rhel8/default-amp"
  module load rhel8/default-amp
  echo "Loading gcc/9.4.0" 
  module load gcc/9.4.0/gcc-11.2.0-72sgv5z
  echo "Swap cuda/11.4 with cuda/11.8"
  module load cuda/11.8
  module unload cuda/11.4 --force
  module unload cuda/11.4.0 --force
  
  # Display compiler information
  echo ""
  echo "Compiler Information:"
  echo "gcc path: $(which gcc)"
  echo "gcc version: $(gcc --version | head -n 1)"
  
  echo ""
  echo "g++ path: $(which g++)"
  echo "g++ version: $(g++ --version | head -n 1)"
  
  echo ""
  echo "gfortran path: $(which gfortran)"
  echo "gfortran version: $(gfortran --version | head -n 1)"
  
  echo ""
  echo "cuda path: $(which nvcc 2>/dev/null || echo "nvcc not found")"
  if command -v nvcc >/dev/null 2>&1; then
  echo "cuda version: $(nvcc --version | grep release | awk '{print $6}')"
  else
  echo "cuda version: not available (nvcc not found in PATH)"
  fi
  
  echo -e "\nEnvironment set up for Fortran-PyTorch development"
}
single-gpu() 
{
    #single-gpu 00:30:00  # 30 minute session
    #single-gpu           # 10 minute session (default)
    sintr -A FTORCH-SL2-GPU -p ampere -N1 -n1 -t "${1:-00:10:00}" --gres=gpu:1 --qos=intr
}
