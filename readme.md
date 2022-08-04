## Setup

## Setup Bare repository

- Using **powershell**, clone this repository into a **.dotfile** directory in you home directory.

```powershell
git clone --bare https://github.com/eduuh/windows.dotfiles "$HOME/.dotfiles"
```
- Checkout the dotfiles from the bare repository

```powershell
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout
```

- Opt to hide other files from git status.

```powershell
dotfiles config --local status.showUntrackedFiles no
```
