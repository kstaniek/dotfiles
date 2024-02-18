[![Test Home Manager configuration.](https://github.com/kstaniek/dotfiles/actions/workflows/test.yml/badge.svg)](https://github.com/kstaniek/dotfiles/actions/workflows/test.yml)

## Dotfiles

This is my collection of configuration files.

Heavely inspired by [dotfiles by Alex Pearce](https://github.com/alexpearce/dotfiles).


## Usage

Install [Nix][nix] with Nix Flake support enabled, for example by using the [Determinate Systems installer][nix-installer].
You should be able to run the `nix flake` command in a shell.

Next, clone this repository. We'll use `~/Code/dotfiles`.

```shell
$ git clone git@github.com:alexpearce/dotfiles.git ~/Code/dotfiles
```

The home-manager profile can then be built and activated:

```shell
$ nix run home-manager/master -- switch --flake ~/Code/dotfiles#apearwin
```

To update dependencies:

```shell
$ nix flake update ~/Code/dotfiles
```

[nix]: https://nixos.org/
[nix-installer]: https://github.com/DeterminateSystems/nix-installer
[home-manager]: https://github.com/nix-community/home-manager
