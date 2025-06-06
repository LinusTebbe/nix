{
  inputs,
  lib,
  config,
  pkgs,
  home-manager,
  ...
}: let
  ignoredFiles = lib.fileset.unions [./default.nix ./home.nix];
in {
  imports =
    lib.fileset.toList (lib.fileset.difference ./. ignoredFiles)
    ++ [
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
      inputs.hardware.nixosModules.common-pc-ssd
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = false;
        home-manager.sharedModules = [inputs.plasma-manager.homeManagerModules.plasma-manager];

        home-manager.users.linus = ./home.nix;
      }
    ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
  boot.kernelModules = ["kvm-amd" "sg"];
  boot.kernelPackages = pkgs.linuxPackages_6_13;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.05";

  powerManagement.cpuFreqGovernor = "performance";
  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";
}
