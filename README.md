# Dotfiles Modules

This repository provides a collection of custom NixOS modules which are in use by me. My actual dotfiles are now private because there is no reason to have private host configurations public. The reusable/public configurations are contained within the modules provided in this repository.

## Usage

To use the modules, add the following flake input to your flake:

```nix
dotfiles-modules = {
  url = "github:quirinecker/dotfiles-modules";
  inputs.nixpkgs.follows = "nixpkgs";
  inputs.zen-browser.follows = "zen-browser";
};

zen-browser = {
  url = "github:0xc000022070/zen-browser-flake";
  inputs.nixpkgs.follows = "nixpkgs";
};

```

Then import the aspcects in the respective environments:

```nix
imports = [
    inputs.dotfiles-modules.modules.homeManager.<aspect>
]
```


```nix
imports = [
    inputs.dotfiles-modules.modules.nixos.<aspect>
]
```

For more information on which aspects are available, see `./modules/*`

## Development

This repository does not run on its own, because it is meant to be used as a flake input. When I develop on this repository I usually override the input on my doftiles flake.
To do this you can usually just add the following option at the end.

```bash
<command to switch configuration> --override-input dotfiles-modules path:$(pwd)
```

This will override the dotfiles-modules input with the flake that is located in the current directory.
You can see below some example usages of this option with different commands.

```bash
nh home switch -- --override-input dotfiles-modules path:$(pwd)
```

```bash
nh os switch -- --override-input dotfiles-modules path:$(pwd)
```

```bash
home-manager switch --flake <path-to-your-local-flake> --override-input dotfiles-modules path:$(pwd)
```

``` bash
nixos-rebuild switch --flake <path-to-your-local-flake> --override-input dotfiles-modules path:$(pwd)
```
