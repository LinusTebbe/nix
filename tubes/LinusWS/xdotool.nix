{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.xdotool
  ];
}
