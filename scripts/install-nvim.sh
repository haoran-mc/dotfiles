#!/bin/bash


sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

sudo tar xzvf nvim-linux64.tar.gz

sudo mv nvim-linux64 /usr/local/nvim

sudo ln -s /usr/local/nvim/bin/nvim /usr/bin/nvim


# NVIM v0.9.1
# Build type: Release
# LuaJIT 2.1.0-beta3
