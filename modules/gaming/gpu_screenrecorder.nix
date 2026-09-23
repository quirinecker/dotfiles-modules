{ ... }: {
  flake.modules.nixos.gpu-screenrecorder = { pkgs, ... }: {
    programs.gpu-screen-recorder.enable = true;
    environment.systemPackages = with pkgs; [
      gpu-screen-recorder
      killall
      libnotify
    ];
  };

  # This modules requires the dotfiles-modules.homeManager.hyprland modules to be imported
  # It adds the relevant scripts and shortcuts to be used in hyprland
  flake.modules.homeManager.gpu-screenrecorder = {
    dotfiles-modules.hyprland.extraConfig = ''
      hl.bind(MainMod .. " + SHIFT + V", hl.dsp.exec_cmd("${./gpu_screenrecorder/save-replay.sh}"))
      hl.on("hyprland.start", function()
        hl.exec_cmd("${./gpu_screenrecorder/start-replay.sh}")
      end)
    '';
  };
}
