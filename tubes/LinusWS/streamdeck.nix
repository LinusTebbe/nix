{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.streamcontroller
    pkgs.gnomeExtensions.streamcontroller-integration
  ];
}
