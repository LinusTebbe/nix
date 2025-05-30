with import ../pubkeys.nix; {
  "user-linus.age".publicKeys = (builtins.attrValues users) ++ (builtins.attrValues hosts);
}
