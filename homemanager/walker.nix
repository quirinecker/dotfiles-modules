{
  lib,
  config,
  pkgs,
  inputs,
  system,
  ...
}:
let
  configHome = "${config.home.homeDirectory}/.config/dotfiles/homes/quirinecker";
    providerOptions = {
    desktopapplications = "Desktop application launcher";
    files = "File search and management";
    clipboard = "Clipboard history management";
    runner = "Command runner";
    symbols = "Symbols and emojis";
    calc = "Calculator and unit conversion";
    menus = "Custom menu system";
    providerlist = "Provider listing and management";
    websearch = "Web search integration";
    todo = "Todo list";
    unicode = "Unicode symbol search";
    bluetooth = "Basic Bluetooth management";
  };
in
{
  imports = [
    inputs.walker.homeManagerModules.walker

  ];
  options = {
    modules.walker.enable = lib.mkEnableOption "walker";
  };

  config = lib.mkIf config.modules.walker.enable {
    programs.walker.enable = true;
    programs.walker.config = lib.trivial.importTOML ./walker/walker.toml;

    home.packages = [
      pkgs.libqalculate
    ];

    xdg.configFile = {
      "elephant/menus/pw.toml".source = ./walker/elephant/menus/pw.toml;
      "elephant/elephant.toml".source = ./walker/elephant.toml;
      # "walker/plugins".source =
      #   config.lib.file.mkOutOfStoreSymlink "${configHome}/.config/walker/plugins";
      # "walker/themes".source = config.lib.file.mkOutOfStoreSymlink "${configHome}/.config/walker/themes";
    };
  };
}
