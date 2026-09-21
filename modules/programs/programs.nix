{ self, inputs, ... }:
let
  tools = pkgs: [
    pkgs.playerctl
    pkgs.imagemagick
    pkgs.meld
    pkgs.wl-clipboard
    pkgs.steam-run
    pkgs.sops
    pkgs.pavucontrol
  ];

  social = pkgs: [
    pkgs.discord
    pkgs.element-desktop
    pkgs.signal-desktop
    pkgs.spotify
  ];

  gnome-apps = pkgs: [
    pkgs.gnome-calculator
    pkgs.gnome-font-viewer
    pkgs.gnome-system-monitor
    pkgs.nautilus
    pkgs.baobab
    pkgs.gnome-disk-utility
  ];

  others = pkgs: [
    pkgs.onlyoffice-desktopeditors
    pkgs.nextcloud-client
    pkgs.vlc
    pkgs.home-manager
  ];
in
{
  flake.modules.nixos.programs = { ... }: {
    imports = [
      self.modules.nixos.flatpak
    ];
  };
  flake.modules.homeManager.programs = { pkgs, config, ... }: {
    imports = [
      self.modules.homeManager.obsidian
      inputs.zen-browser.homeModules.beta
    ];

    programs.firefox.enable = true;
    programs.chromium.enable = true;
    programs.vscode.enable = true;
    programs.zen-browser.enable = true;

    programs.nh = {
      enable = true;
      # clean.enable = true;
      # clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "${config.home.homeDirectory}/.config/dotfiles";
    };

    home.packages = tools pkgs ++ social pkgs ++ gnome-apps pkgs ++ others pkgs;
  };
}
