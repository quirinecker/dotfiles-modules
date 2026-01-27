# Dotfiles Modules

This repository provides a collection of custom NixOS modules which are in use by me. My actual dotfiles are now private because there is no reason to have private host configurations public. The reusable/public configurations are contained within the modules provided in this repository.

## Usage

To use the modules, add the following flake input to your flake:

```nix
dotfiles-modules = {
	url = "github:quirinecker/dotfiles-modules";
	inputs.nixpkgs.follows = "nixpkgs";
};
```

In case you want to update the input flakes this flake imports yourself (recommended), then you would need to declare the inputs yourself
and make this flake follow those inputs:

```nix
dotfiles-modules = {
  url = "github:quirinecker/dotfiles-modules";
  inputs.nixpkgs.follows = "nixpkgs";
  inputs.zen-browser.follows = "zen-browser";
  inputs.walker.follows = "walker";
  inputs.elephant.follows = "elephant";
};

zen-browser = {
  url = "github:0xc000022070/zen-browser-flake";
  inputs.nixpkgs.follows = "nixpkgs";
};

walker = {
  url = "github:abenz1267/walker";
  inputs.nixpkgs.follows = "nixpkgs";
  inputs.elephant.follows = "elephant";
};

elephant = {
	url = "github:abenz1267/elephant";
	inputs.nixpkgs.follows = "nixpkgs";
};
```

Then import the modules in your home-manager configuration or add it to the modules of the home configuration:

```nix
imports = [
    inputs.dotfiles-modules.homeManager
]
```

or

```nix

homeConfigurations.<username> = home-manager.lib.homeManagerConfiguration {
	...
	modules = [
		inputs.dotfiles-modules.homeManager
	];
};

```

**Note:** If you are new to NixOS, i might add a template repository for the modules which should be simmilar to my own homemanager config.

## Modules

The docs for the individual mdoules can be found [here](options.md).

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
