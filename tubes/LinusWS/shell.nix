{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.direnv
  ];
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "agnoster";
    };

    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };

  programs.zsh.interactiveShellInit = ''eval "$(direnv hook zsh)"'';
}
