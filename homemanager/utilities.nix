{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    modules.utilities.enable = lib.mkEnableOption "utilities";
  };

  config = lib.mkIf config.modules.utilities.enable {
    programs.zen-browser.enable = true;
    programs.firefox.enable = true;

    programs.nh = {
      enable = true;
      # clean.enable = true;
      # clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "${config.home.homeDirectory}/.config/dotfiles";
    };

    home.packages = [

      # note taking
      pkgs.rnote
      pkgs.saber
      pkgs.playerctl

      # tools
      pkgs.imagemagick
      pkgs.meld
      pkgs.entr
      pkgs.wl-clipboard
      pkgs.steam-run
      pkgs.sops

      # editors
      pkgs.zed-editor
      pkgs.vscode

      # browsers
      pkgs.chromium

      # others
      pkgs.libreoffice-qt
      pkgs.gimp
      pkgs.nextcloud-client

      # language interpreters / compilers
      pkgs.bun
      pkgs.python3
      pkgs.typescript

      # Gnome Packages
      pkgs.gnome-calendar
      pkgs.gnome-contacts
      pkgs.gnome-calculator
      pkgs.gnome-font-viewer
      pkgs.gnome-system-monitor
      pkgs.geary
      pkgs.nautilus

      # social
      pkgs.discord
      pkgs.signal-desktop
      pkgs.spotify

      # language interpreters / compilers
      pkgs.bun
      pkgs.python3
      pkgs.typescript
      pkgs.typst
    ];
  };
}
