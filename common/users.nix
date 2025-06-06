{config, ...}: {
  age.secrets.user-linus.file = ../secrets/user-linus.age;

  users = {
    mutableUsers = false;
    groups.linus.gid = 1000;

    users = {
      root.hashedPassword = "!";
      linus = {
        uid = 1000;
        description = "Linus";
        isNormalUser = true;
        hashedPasswordFile = config.age.secrets.user-linus.path;
        openssh.authorizedKeys.keys = let
          pubkeys = import ../pubkeys.nix;
        in (
          builtins.attrValues pubkeys.users
          ++ builtins.attrValues pubkeys.hosts
        );
        extraGroups = ["wheel" "docker" "networkmanager"];
        linger = true;
      };
    };
  };
}
