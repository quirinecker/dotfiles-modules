{ self, ... }:
{
  flake.modules.homeManager.shell = { ... }: {
    imports = [
      self.modules.homeManager.starship
      self.modules.homeManager.fish
      self.modules.homeManager.nushell
      self.modules.homeManager.tmux
      self.modules.homeManager.ghostty
      self.modules.homeManager.direnv
    ];
  };

}
