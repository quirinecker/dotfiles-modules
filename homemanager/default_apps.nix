{
  lib,
  config,
  ...
}:
let
  defaultBrowser = "zen-beta";
in
{
  options = {
    modules.default_apps.enable = lib.mkEnableOption "default_apps";
  };

  config = lib.mkIf config.modules.default_apps.enable {
    xdg.mimeApps.enable = true;
    xdg.mimeApps.defaultApplications = {
      "text/html" = "${defaultBrowser}.desktop";
      "x-scheme-handler/http" = "${defaultBrowser}.desktop";
      "x-scheme-handler/https" = "${defaultBrowser}.desktop";
      "x-scheme-handler/about" = "${defaultBrowser}.desktop";
      "inode/directory" = "org.gnome.Nautilus.desktop";
    };

    xdg.terminal-exec.enable = true;
    xdg.terminal-exec.settings = {
      default = [ "ghostty.desktop" ];
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "ghostty";
      TERM = "ghostty";
    };
  };
}
