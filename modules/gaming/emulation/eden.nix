{ ... }:
{
  flake.modules.nixos.eden = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ eden ];
  };

  flake.modules.homeManager.eden = { config, ... }: let
    configHome = config.home.homeDirectory;

    resolveGamePath = game: "${configHome}/.edenroms/${game}/${game}.nsp";
  in {
    # imports = [ inputs.vdf-nix.modules.homeManager.vdf ];

    vdf.shortcuts = {
      "208933471" = [
        {
          "appid" = 3694432012;
          "AppName" = "Super Mario Bros Wonder";
          "Exe" = "eden-cli";
          "StartDir" = "/home/quirinecker/";
          "icon" = "${./eden/super_mario_bros_wonders/logo.png}";
          "ShortcutPath" = "";
          "LaunchOptions" = "--game ${resolveGamePath "super_mario_bros_wonders"} --fullscreen";
          "IsHidden" = 0;
          "AllowDesktopConfig" = 1;
          "AllowOverlay" = 1;
          "OpenVR" = 0;
          "Devkit" = 0;
          "DevkitGameID" = "";
          "DevkitOverrideAppID" = 0;
          "LastPlayTime" = 1788863266;
          "FlatpakAppID" = "";
          "sortas" = "";
          "tags" = { };
          grid = {
            logo = ./eden/super_mario_bros_wonders/logo.png;
            hero = ./eden/super_mario_bros_wonders/hero.png;
            portrait = ./eden/super_mario_bros_wonders/portrait.png;
            landscape = ./eden/super_mario_bros_wonders/landscape.png;
          };
        }
        {
          "appid" = 2240985812;
          "AppName" = "Pokemon Lets Go Eevee";
          "Exe" = "eden-cli";
          "StartDir" = "/home/quirinecker/";
          "icon" = "${./eden/super_mario_bros_wonders/logo.png}";
          "ShortcutPath" = "";
          "LaunchOptions" = "--game ${resolveGamePath "pokemon_lets_go_eevee"} --fullscreen";
          "IsHidden" = 0;
          "AllowDesktopConfig" = 1;
          "AllowOverlay" = 1;
          "OpenVR" = 0;
          "Devkit" = 0;
          "DevkitGameID" = "";
          "DevkitOverrideAppID" = 0;
          "LastPlayTime" = 1788863266;
          "FlatpakAppID" = "";
          "sortas" = "";
          "tags" = { };
          grid = {
            logo = ./eden/pokemon_lets_go_eevee/logo.png;
            hero = ./eden/pokemon_lets_go_eevee/hero.png;
            portrait = ./eden/pokemon_lets_go_eevee/portrait.png;
            landscape = ./eden/pokemon_lets_go_eevee/landscape.png;
          };
        }
      ];
    };
  };
}
