{ ... }:
{
  flake.modules.homeManager.direnv = { ... }: {
    programs.direnv.enable = true;
    programs.direnv.silent = true;
  };
}
