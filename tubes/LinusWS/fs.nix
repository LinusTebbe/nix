{...}: {
  fileSystems = let
    mkDisk = label: {
      inherit label;
      fsType = "ext4";
      options = ["rw" "relatime"];
    };
  in {
  };
}
