{ ... }: {
  flake.modules.nixos.steam = { ... }: {
    programs.steam.enable = true;
  };

  # requires dotfiles-modules.modules.nixos.hyprland to function
  # this is also only compatible with a home on the qepc system
  flake.modules.homeManager.qepc-steamtv = { pkgs, ... }: {
    dotfiles-modules.hyprland.extraConfig = ''
      hl.bind(MainMod .. "+ SHIFT + G",
        hl.dsp.exec_cmd(
          "${pkgs.gamescope}/bin/gamescope -W 2560 -H 1440 -f -e -- steam -bigpicture",
          { workspace = "9" }
        )
      )
    '';
  };
}
