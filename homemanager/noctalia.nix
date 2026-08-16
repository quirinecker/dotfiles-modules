{
  lib,
  config,
  ...
}:
{
  options = {
    modules.noctalia.enable = lib.mkEnableOption "noctalia";
    modules.noctalia.isLaptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia = {
      enable = true;
      settings = (import ./noctalia/settings.nix) {
        isLaptop = config.modules.noctalia.isLaptop;
      };
    };
  };

}
