{ self, ... }:
{
  flake.modules.homeManager.editor = { ... }: {
    imports = [
      self.modules.homeManager.editorconfig
      self.modules.homeManager.neovim
    ];
  };
}
