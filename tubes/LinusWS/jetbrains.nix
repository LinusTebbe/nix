{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    jetbrains.rust-rover
    jetbrains.phpstorm
    jetbrains.idea-community
  ];
}
