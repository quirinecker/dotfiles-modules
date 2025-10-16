# Dotfiles Modules

This repository provides a collection of custom NixOS modules which are in use by me. My actual dotfiles are now private because there is no reason to have private host configurations public. The reusable/public configurations are contained within the modules provided in the repository.

## Usage

To use the modules, add the following flake input to your flake:

```nix
dotfiles-modules = {
	url = "gitlab:quirinecker/dotfiles-modules";
	inputs.nixpkgs.follows = "nixpkgs";
};
```

In case you want to update the input flakes this flake imports yourself (recommended), then you would need to declare the inputs yourself
and make this flake follow those inputs:

```nix
dotfiles-modules = {
  url = "gitlab:quirinecker/dotfiles-modules";
  inputs.nixpkgs.follows = "nixpkgs";
  inputs.zen-browser.follows = "zen-browser";
  inputs.walker.follows = "walker";
};

zen-browser = {
  url = "github:0xc000022070/zen-browser-flake";
  inputs.nixpkgs.follows = "nixpkgs";
};

walker = {
  url = "github:abenz1267/walker";
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

I am using [nh](https://github.com/nix-community/nh) for my nixos configuration and this is alos how I develop/test the modules. Below is the command.
This works for me, because I have configured nh to know where my primary flake is located.

```bash
nh home switch -- --override-input dotfiles-modules path:$(pwd)
```

If you forked this repository and want to make some changes something along the lines of the second command could suit your needs.

```
home-manager switch --flake <path-to-your-local-flake> --override-input dotfiles-modules path:$(pwd)
```

**Note:** In the future I might add nixos modules too, in which case I will update the commands becuase the `home-manager` / `nh` command will only update the home config.
