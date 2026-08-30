{ ... }:
let
  gtkOptions = {
    gtk-enable-primary-paste = false;
  };
  gtkTheme = pkgs:  {
    name = "Adwaita-dark";
    package = pkgs.gnome-themes-extra;
  };
in
{
  flake.modules.homeManager.desktop-theme = { pkgs, ... }: {
    gtk = {
      enable = true;
      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
      theme = gtkTheme pkgs;
      gtk4.theme = gtkTheme pkgs;
      gtk4.extraConfig = gtkOptions;
      gtk3.extraConfig = gtkOptions;
    };

    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style.name = "adwaita-dark";
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-key-theme = "Default";
      };
    };

    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      hyprcursor.enable = true;
    };

  };
}
