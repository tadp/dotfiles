# Tad's Dotfiles

In computing a "dot file" is a hidden directory or
file on a UNIX/Linux system that are so named because the file is prefixed
with a full stop. Dotfiles within a user's home directory contain most of
the user-specific configuration available on a desktop and are configured
manually or through the use of tools. 

This is a [homesick](https://github.com/technicalpickles/homesick) compatible
repo.

    Prerequisites on a fresh machine:
    https://github.com/robbyrussell/oh-my-zsh
    https://github.com/thoughtbot/laptop
    https://github.com/prettier/prettier

    Install:
    homesick clone tadp/dotfiles
    homesick symlink dotfiles
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    run ':PluginInstall' in vim

    Uninstall:
    homesick unlink dotfiles
    rm -rf ~/.homesick
    gem uninstall homesick

The below tree is an overview of what's contained in this repository.

    home/                  - my `$HOME` directory (e.g. `/home/tad`)
      |-- vimrc/           - Mac Vim file
      |-- tmux.conf/       - Tmux config file
      |-- linuxvim/        - Linux specific Vim configuration files
      |   |-- vimrc/       - Vimrc file


Dotfiles to peruse:
https://github.com/croaky/dotfiles

- Explore Plug
https://jordaneldredge.com/blog/why-i-switched-from-vundle-to-plug/

