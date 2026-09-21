{ ... }:
{
  flake.modules.nixos.eden = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ eden ];
  };

  flake.modules.homeManager.eden =
    { config, ... }:
    let
      configHome = config.home.homeDirectory;

      resolveGamePath = game: "${configHome}/.edenroms/${game}/${game}.nsp";
    in
    {
      vdf.shortcuts = {
        "208933471" = [
          {
            "appid" = 3694432012;
            "AppName" = "Super Mario Bros Wonder";
            "Exe" = "eden";
            "StartDir" = "/home/quirinecker/";
            "icon" = "${./eden/super_mario_bros_wonders/logo.png}";
            "ShortcutPath" = "";
            "LaunchOptions" = "-f ${resolveGamePath "super_mario_bros_wonders"}";
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
            "Exe" = "eden";
            "StartDir" = "/home/quirinecker/";
            "icon" = "${./eden/pokemon_lets_go_eevee/logo.png}";
            "ShortcutPath" = "";
            "LaunchOptions" = "-f ${resolveGamePath "pokemon_lets_go_eevee"}";
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
          {
            "appid" = 4034108117;
            "AppName" = "Super Mario 3D World";
            "Exe" = "eden";
            "StartDir" = "/home/quirinecker/";
            "icon" = "${./eden/super_mario_3d_world/icon.png}";
            "ShortcutPath" = "";
            "LaunchOptions" = "-f ${resolveGamePath "super_mario_3d_world"}";
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
              logo = ./eden/super_mario_3d_world/logo.png;
              hero = ./eden/super_mario_3d_world/hero.png;
              portrait = ./eden/super_mario_3d_world/portrait.png;
              landscape = ./eden/super_mario_3d_world/landscape.png;
            };
          }
        ];
      };
    };
}
