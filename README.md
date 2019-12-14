# Dotfiles

This repo holds some config files for my favorite GNU/Linux software.
It is heavily based on the [dotfiles by woefe](https://github.com/woefe/dotfiles).

## How to use it

1. Clone this repo:

    ```shell
    git clone --recursive https://bitbucket.org/abakus2000/dotfiles/src/master/
    cd $HOME/.dotfiles
    ```

2. Install GNU Stow:

    ```shell
    # On Arch Linux
    sudo pacman -S stow
    ```

3. Uncomment the lines in install.sh of dotfiles you want to install

4. Execute `./install.sh`
    Make sure that you run the script in the main dotfiles directory.
    I.e. change directory to `.dotfiles` first.
