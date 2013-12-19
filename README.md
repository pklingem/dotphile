dotphile
========

_show your dotfiles some love_

manage your dotfiles with GNU Stow and Git

# Assumptions

* the `dotphile` executable is in your `$PATH`
* your dotfiles are located at `~/dotfiles`
* `git config --get github.user` returns a github profile with an accessible repository named __dofiles__

# Commands

## add

`dotphile add vim ~/.vimrc`

1.  ensure `~/dotfiles` is a clone of `git@github.com:pklingem/dotfiles`
2.  ensure `~/dotfiles/vim` exists
3.  ensure `~/.vimrc` is a symlink to `~/dotfiles/vim/.vimrc`
4.  commit changes to `~/dotfiles/vim`

### Arguments

1.  configuration identifier

    often the name of the application to which the configuration will be applied; the stow source directory.
    
    _ex: vim_

2.  config file

    full path to the file to be added to the configuration
