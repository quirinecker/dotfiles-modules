{ ... }: {
  flake.modules.nixos.steam = { ... }: {
    programs.steam.enable = true;
  };

  # requires dotfiles-modules.modules.nixos.hyprland to function
  # this is also only compatible with a home on the qepc system
  flake.modules.homeManager.qepc-steamtv = { pkgs, ... }: {
    dotfiles-modules.hyprland.extraConfig =
      let
        audioDeviceSearchTerm = "SONY TV";
        script = pkgs.writeShellScriptBin "switch-to-steam-tv" ''
          nu -c 'wpctl set-default (wpctl status | lines | where ($it | str contains "${audioDeviceSearchTerm}") | str replace -r "│\\s*(\\d+).*" "$1" | first)'
          ${pkgs.gamescope}/bin/gamescope -W 2560 -H 1440 -f -e -- steam -bigpicture
        '';
      in
      ''
        hl.bind(MainMod .. "+ SHIFT + G",
          hl.dsp.exec_cmd(
            "${script}/bin/switch-to-steam-tv",
            { workspace = "9" }
          )
        )
      '';
  };
}
