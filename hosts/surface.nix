{ pkgs, nixos-hardware, ... }:
{
  imports = [
    ./hardware-configuration.nix
    nixos-hardware.nixosModules.microsoft-surface-pro-intel
    ../nixos
  ];

  nixpkgs.config.allowUnfree = true;
  hardware.microsoft-surface.kernelVersion = "stable";

  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_6_12.cpupower
  ];

  services.iptsd.enable = true;
}
