{
  description = ''
    A collection of custom NixOS modules and packages I use.
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      ...
    }:
    {
      homeManager = {
        imports = [
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
      };

    };
}
