{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.software.home.vscode;
in {
  options.software.home.vscode = {
    enable = lib.mkEnableOption "enable vscode";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    # Install vscode
    programs.vscode = {
      enable = true;
    };
  };
}
