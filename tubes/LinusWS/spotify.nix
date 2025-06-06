{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.spotify
  ];
  networking.firewall.allowedUDPPorts = [5353];
}
