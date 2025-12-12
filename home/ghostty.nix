{ pkgs, ... }:
{
  programs.ghostty.enable = true;
  programs.ghostty.settings.command =
    if pkgs.stdenv.isDarwin then "~/.nix-profile/bin/fish" else "fish";
  programs.ghostty.enableFishIntegration = true;
}
