{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.xorg.xbacklight
  ];
}
