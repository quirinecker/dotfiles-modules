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
  };
}
