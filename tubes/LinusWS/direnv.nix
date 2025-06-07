{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.direnv
  ];
  programs.bash.interactiveShellInit = ''eval "$(direnv hook bash)"'';
}
