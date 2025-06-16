{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.noisetorch
  ];
}
