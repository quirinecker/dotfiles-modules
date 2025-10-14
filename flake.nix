{
  description = ''
    A collection of custom NixOS modules and packages I use.
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./homemanager/default_apps.nix
        ./homemanager/editorconfig.nix
        ./homemanager/fish.nix
        ./homemanager/hyprland.nix
        ./homemanager/hyprpanel.nix
        ./homemanager/neovim.nix
        ./homemanager/nushell.nix
        ./homemanager/starship.nix
        ./homemanager/theme.nix
        ./homemanager/tmux.nix
        ./homemanager/utilities.nix
        ./homemanager/walker.nix
        ./homemanager/terminal_emulators/ghostty.nix
        ./homemanager/terminal_emulators/kitty.nix
        ./homemanager/terminal_emulators/wezterm.nix
      ];

      options = pkgs.lib.evalModules {
        specialArgs = {
          inherit inputs pkgs;
        };
        modules = modules;
      };
    in
    {
      homeManager = {
        imports = modules;
      };

      packages.${system}.docs =
        (pkgs.nixosOptionsDoc {
          options = options;
          documentType = "markdown";
        }).optionsCommonMark;

    };
}
