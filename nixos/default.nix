{ pkgs, ... }:
{
  system.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics.enable = true;

  services.pulseaudio.enable = true;

  programs.dconf.enable = true;

  users.users.sammi = {
    isNormalUser = true;
    description = "samantha watt";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  time.timeZone = "America/Vancouver";

  security.polkit.enable = true;

  imports = [
    ./i18n.nix
    ./networking.nix
    ./fonts.nix
  ];
}
