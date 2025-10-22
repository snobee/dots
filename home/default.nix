{
  pkgs,
  ...
}:
{
  home.stateVersion = "24.11";
  home.username = "sammi";
  home.homeDirectory = "/home/sammi";

  programs.home-manager.enable = true;

  imports = [
    ./base.nix
    ./apps.nix
    ./theme.nix
  ];
}
