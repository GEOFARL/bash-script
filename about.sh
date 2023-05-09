#!/bin/bash

echo "Shell: $SHELL"
echo "Bash version: $BASH_VERSION"
echo "PATH: $PATH"
echo "OS and kernel: $(uname -sr)"
echo "Compiler version: $(gcc --version | head -n 1)"
echo "Shared libraries required by this program:"

ldd /path/to/program | awk '{print $3}'
