{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.direnv
  ];

  programs.direnv = {
    package = pkgs.direnv;
    silent = true;
    loadInNixShell = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
  environment.etc."direnv/direnv.toml".text = ''
    [global]
    hide_env_diff = true
  '';
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
  users.defaultUserShell = pkgs.zsh;
  system.userActivationScripts.zshrc = "touch .zshrc";

  programs.zsh.interactiveShellInit = ''eval "$(direnv hook zsh)"'';
}
