## _module\.args

Additional arguments passed to each module in addition to ones
like ` lib `, ` config `,
and ` pkgs `, ` modulesPath `\.

This option is also available to all submodules\. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules\. The sole exception to
this is the argument ` name ` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute\.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

 - ` lib `: The nixpkgs library\.

 - ` config `: The results of all options after merging the values from all modules together\.

 - ` options `: The options declared in all modules\.

 - ` specialArgs `: The ` specialArgs ` argument passed to ` evalModules `\.

 - All attributes of ` specialArgs `
   
   Whereas option values can generally depend on other option values
   thanks to laziness, this does not apply to ` imports `, which
   must be computed statically before anything else\.
   
   For this reason, callers of the module system can provide ` specialArgs `
   which are available during import resolution\.
   
   For NixOS, ` specialArgs ` includes
   ` modulesPath `, which allows you to import
   extra modules from the nixpkgs package tree without having to
   somehow make the module aware of the location of the
   ` nixpkgs ` or NixOS directories\.
   
   ```
   { modulesPath, ... }: {
     imports = [
       (modulesPath + "/profiles/minimal.nix")
     ];
   }
   ```

For NixOS, the default value for this option includes at least this argument:

 - ` pkgs `: The nixpkgs package set according to
   the ` nixpkgs.pkgs ` option\.



*Type:*
lazy attribute set of raw value

*Declared by:*
 - [\<nixpkgs/lib/modules\.nix>](https://github.com/NixOS/nixpkgs/blob//lib/modules.nix)



## modules\.default_apps\.enable



Whether to enable default_apps\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/default_apps\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/default_apps.nix)



## modules\.editorconfig\.enable



Whether to enable enables editorconfig\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/editorconfig\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/editorconfig.nix)



## modules\.fish\.enable



Whether to enable fish\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/fish\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/fish.nix)



## modules\.hyprland\.enable



Whether to enable hyprland\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprland\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprland.nix)



## modules\.hyprpanel\.enable



Whether to enable hyprpanel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprpanel\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprpanel.nix)



## modules\.hyprpanel\.avatar\.image



avatar image



*Type:*
absolute path



*Default:*
` "" `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprpanel\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprpanel.nix)



## modules\.hyprpanel\.avatar\.name



Username to be displayed



*Type:*
string



*Default:*
` "John Doe" `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprpanel\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/hyprpanel.nix)



## modules\.neovim\.enable



Whether to enable neovim\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/neovim\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/neovim.nix)



## modules\.nushell\.enable



Whether to enable nushell\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/nushell\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/nushell.nix)



## modules\.starship\.enable



Whether to enable enables starship\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/starship\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/starship.nix)



## modules\.terminalEmulators\.ghostty\.enable



Whether to enable ghostty\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/terminal_emulators/ghostty\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/terminal_emulators/ghostty.nix)



## modules\.terminalEmulators\.kitty\.enable



Whether to enable kitty\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/terminal_emulators/kitty\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/terminal_emulators/kitty.nix)



## modules\.terminalEmulators\.wezterm\.enable



Whether to enable kitty\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/terminal_emulators/wezterm\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/terminal_emulators/wezterm.nix)



## modules\.theme\.enable



Whether to enable theme\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/theme\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/theme.nix)



## modules\.tmux\.enable



Whether to enable tmux\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/tmux\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/tmux.nix)



## modules\.utilities\.enable



Whether to enable utilities\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/utilities\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/utilities.nix)



## modules\.walker\.enable



Whether to enable walker\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/walker\.nix](file:///nix/store/a661xl77ba24lv1j80jyijjvk1h6h1vz-source/homemanager/walker.nix)


