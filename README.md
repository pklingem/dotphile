# dotphile

_show your dotfiles some love_

A simple shell script to manage your dotfiles using GNU Stow and Git.

## What is this?

`dotphile` is a lightweight wrapper around [GNU Stow](https://www.gnu.org/software/stow/) that makes it easy to manage your configuration files (dotfiles) in a Git repository and symlink them to their proper locations.

## Prerequisites

- **GNU Stow** - for managing symlinks
- **Git** - for version control
- **macOS only**: Homebrew and `findutils` (for `gfind`)

Install on macOS:
```bash
brew install stow findutils
```

Install on Linux:
```bash
# Debian/Ubuntu
sudo apt-get install stow

# Fedora
sudo dnf install stow

# Arch
sudo pacman -S stow
```

## Installation

```bash
curl -O https://raw.githubusercontent.com/pklingem/dotphile/master/dotphile
chmod +x dotphile
sudo mv dotphile /usr/local/bin/
```

## Usage

### Link all dotfiles

Symlink all packages from `~/dotfiles` to your home directory:

```bash
dotphile -l
# or
dotphile --link
```

This will:
1. Clone your dotfiles repository to `~/dotfiles` (if it doesn't exist)
2. Initialize and update Git submodules
3. Create symlinks for all packages in `~/dotfiles`

### Add a new configuration

Move a configuration file to your dotfiles repository and symlink it back:

```bash
dotphile -a <package-name> <config-path>
# or
dotphile --add <package-name> <config-path>
```

**Example:**
```bash
dotphile -a vim ~/.vimrc
```

This will:
1. Move `~/.vimrc` to `~/dotfiles/vim/.vimrc`
2. Create a symlink from `~/.vimrc` back to `~/dotfiles/vim/.vimrc`

## How it works

dotphile organizes your dotfiles into packages within `~/dotfiles`. Each package is a directory that mirrors your home directory structure. GNU Stow then creates symlinks from your home directory to the files in each package.

**Directory structure example:**
```
~/dotfiles/
├── vim/
│   └── .vimrc
├── bash/
│   ├── .bashrc
│   └── .bash_profile
└── git/
    └── .gitconfig
```

When you run `dotphile -l`, it creates:
- `~/.vimrc` → `~/dotfiles/vim/.vimrc`
- `~/.bashrc` → `~/dotfiles/bash/.bashrc`
- `~/.bash_profile` → `~/dotfiles/bash/.bash_profile`
- `~/.gitconfig` → `~/dotfiles/git/.gitconfig`

## Configuration

### Dotfiles Directory

By default, dotphile uses `~/dotfiles` as the dotfiles directory. You can customize this using the `DOTPHILE_PATH` environment variable:

```bash
# Set for a single command
DOTPHILE_PATH=~/my-dotfiles dotphile -l

# Or export it in your shell profile
export DOTPHILE_PATH=~/my-dotfiles
dotphile -l
```

### Git Repository

By default, dotphile clones from `git@github.com:pklingem/dotfiles`. You can customize this using the `DOTPHILE_GIT_REPO` environment variable:

```bash
# Set for a single command
DOTPHILE_GIT_REPO=git@github.com:yourusername/dotfiles dotphile -l

# Or export it in your shell profile
export DOTPHILE_GIT_REPO=git@github.com:yourusername/dotfiles
dotphile -l

# Works with HTTPS URLs too
export DOTPHILE_GIT_REPO=https://github.com/yourusername/dotfiles.git
```

You can also combine both environment variables:

```bash
export DOTPHILE_PATH=~/my-dotfiles
export DOTPHILE_GIT_REPO=git@github.com:yourusername/dotfiles
dotphile -l
```

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Credits

Inspired by [Managing dotfiles with GNU stow](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/) by [@alexpearce](https://github.com/alexpearce)
