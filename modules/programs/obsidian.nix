{ ... }:
{
  flake.modules.homeManager.obsidian = { ... }: {
    programs.obsidian.enable = true;
    programs.obsidian = {
      vaults."Personal" = {
        enable = true;
        target = "Nextcloud/obsidian/Personal";
        settings = { };
      };
    };

    dotfiles-modules.hyprland.extraConfig = ''
      hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("xdg-open obsidian://open?vault=Personal&file=$(date -I).md"))
    '';
  };
}
