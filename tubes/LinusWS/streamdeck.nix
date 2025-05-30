{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.streamdeck-ui
  ];
  programs.streamdeck-ui = {
    enable = true;
    autoStart = true;
  };
}
