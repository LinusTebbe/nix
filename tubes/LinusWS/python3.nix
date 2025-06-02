{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.python3Full.withPackages
    (ps: with ps; [pip])
  ];
}
