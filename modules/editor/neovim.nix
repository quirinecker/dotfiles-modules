{ inputs, ... }:
{
  flake.modules.homeManager.neovim = { pkgs, config, lib, ... }:
  let
    configHome = "${config.home.homeDirectory}/.config/dotfiles/homes/quirinecker";
    rlang = pkgs.rWrapper.override {
      packages = with pkgs.rPackages; [
        languageserver
        box
        xtable
        dplyr
        svSweave
        knitr
      ];
    };

  in
  {
    home.sessionVariables = {
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };

    programs.neovim.enable = true;
    programs.zathura.enable = true;
    home.packages = [
      pkgs.cargo
      pkgs.rustc
      pkgs.nodejs
      pkgs.yarn
      pkgs.unzip
      pkgs.ripgrep
      pkgs.fd
      pkgs.luajitPackages.lua-lsp
      pkgs.lua-language-server
      pkgs.nil
      pkgs.nixfmt
      pkgs.nixd
      pkgs.rust-analyzer
      pkgs.rustfmt
      pkgs.typescript-language-server
      pkgs.vue-language-server
      pkgs.vtsls
      pkgs.deno
      pkgs.vscode-langservers-extracted
      pkgs.yaml-language-server
      rlang
      pkgs.jdt-language-server
      pkgs.tailwindcss-language-server
      pkgs.pyright
      pkgs.protols
      pkgs.clang-tools
      pkgs.taplo
      pkgs.tinymist
      pkgs.dart
      pkgs.tree-sitter
    ];
    xdg.configFile = {
      "nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./neovim/init.lua;
      "nvim/lua".source = config.lib.file.mkOutOfStoreSymlink ./neovim/lua;
      "nvim/ftplugin".source = config.lib.file.mkOutOfStoreSymlink ./neovim/ftplugin;
      "nvim/projects".source = config.lib.file.mkOutOfStoreSymlink ./neovim/projects;
    };

    # Todo: fix vue language server
    # home.activation.npm-install = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   nix-shell -p nodejs --run "cd ${configHome}/.npm_global && npm install"
    # '';
  };

  perSystem = { pkgs, ... }: {
    packages.neovim = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.neovim;
      flags = {
        "-u" = ./neovim/init.lua;
      };
    };
  };
}
