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

    nix-options-doc = {
      url = "github:Thunderbottom/nix-options-doc";
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

      externalModules = [
        inputs.walker.homeManagerModules.default
        inputs.zen-browser.homeModules.beta
      ];
    in
    {
      homeManager = {
        imports = modules ++ externalModules;
      };

      docs = pkgs.runCommand "docs" { } ''
        ${
          inputs.nix-options-doc.outputs.packages."${system}".default
        }/bin/nix-options-doc --path ${./homemanager} --out $out
      '';
    };
}
