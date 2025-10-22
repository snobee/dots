{ pkgs, nixos-hardware, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../nixos
  ];

  nixpkgs.config.permittedInsecurePackages = [ "broadcom-sta-6.30.223.271-57-6.12.53" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  boot.kernelModules = [ "wl" ];
  boot.initrd.kernelModules = [ "wl" ];
}
