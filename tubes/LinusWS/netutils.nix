{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.inetutils
  ];
}
