{ config, lib, pkgs, ... }: {
   services.goxlr-utility = {
      enable = true;
      autoStart.xdg = true;
   };
}
