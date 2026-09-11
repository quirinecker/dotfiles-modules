{ inputs, ... }:
{
  flake.modules.homeManager.cemu = { ... }: {
    imports = [ inputs.vdf-nix.modules.homeManager.vdf ];

    vdf.shortcuts = {
      "208933471" = [
        {
          "appid" = 3181457528;
          "AppName" = "Zelda: Breath of the Wild";
          "Exe" = "cemu";
          "StartDir" = "/home/quirinecker/";
          "icon" = "${./cemu/botw/logo.png}";
          "ShortcutPath" = "";
          "LaunchOptions" = "--title-id 00050000101c9500 --fullscreen";
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
            logo = ./cemu/botw/logo.png;
            hero = ./cemu/botw/hero.png;
            portrait = ./cemu/botw/portrait.png;
            landscape = ./cemu/botw/landscape.png;
          };
        }
        {
          "appid" = 3604872806;
          "AppName" = "Skylanders SwapForce";
          "Exe" = "cemu";
          "StartDir" = "/home/quirinecker/";
          "icon" = "/home/quirinecker/Downloads/49616854cfb1b647aa07bcdbae4e484d.png";
          "ShortcutPath" = "";
          "LaunchOptions" = "--title-id 0005000010139200 --fullscreen";
          "IsHidden" = 0;
          "AllowDesktopConfig" = 1;
          "AllowOverlay" = 1;
          "OpenVR" = 0;
          "Devkit" = 0;
          "DevkitGameID" = "";
          "DevkitOverrideAppID" = 0;
          "LastPlayTime" = 1788025801;
          "FlatpakAppID" = "";
          "sortas" = "";
          "tags" = { };
          grid = {
            logo = ./cemu/swapforce/logo.png;
            hero = ./cemu/swapforce/hero.png;
            portrait = ./cemu/swapforce/portrait.png;
            landscape = ./cemu/swapforce/landscape.png;
          };
        }

        {
          "appid" = 2171090255;
          "AppName" = "Skylanders Imaginators";
          "Exe" = "cemu";
          "StartDir" = "/home/quirinecker/";
          "icon" = "${./cemu/imaginators/logo.png}";
          "ShortcutPath" = "";
          "LaunchOptions" = "--title-id 00050000101fb100 --fullscreen";
          "IsHidden" = 0;
          "AllowDesktopConfig" = 1;
          "AllowOverlay" = 1;
          "OpenVR" = 0;
          "Devkit" = 0;
          "DevkitGameID" = "";
          "DevkitOverrideAppID" = 0;
          "LastPlayTime" = 1788025801;
          "FlatpakAppID" = "";
          "sortas" = "";
          "tags" = { };
          grid = {
            logo = ./cemu/imaginators/logo.png;
            hero = ./cemu/imaginators/hero.png;
            portrait = ./cemu/imaginators/portrait.png;
            landscape = ./cemu/imaginators/landscape.png;
          };
        }
      ];
    };
  };

  flake.modules.nixos.cemu = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ cemu ];

    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="1430", ATTRS{idProduct}=="0150", MODE="0666"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", MODE="0666", GROUP="users", TAG+="uaccess"
    '';
  };
}
