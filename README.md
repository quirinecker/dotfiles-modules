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

Then import the modules in your home-manager configuration:

```nix
imports = [
	inputs.dotfiles-modules.homemanager.default_apps
]
```

**Note:** If you are new to NixOS, i might add a template repository for the modules which should be simmilar to my own homemanager config.

## Modules

There will be a link to the documentation for each module. This repository is still work in progress
