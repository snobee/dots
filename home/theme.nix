{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    adwaita-icon-theme
  ];

  stylix.enable = true;
  stylix.image =
    pkgs.fetchFromGitHub {
      owner = "zhichaoh";
      repo = "catppuccin-wallpapers";
      rev = "main";
      sha256 = "h+cFlTXvUVJPRMpk32jYVDDhHu1daWSezFcvhJqDpmU=";
    }
    + "/misc/comfy-home.png";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

  stylix.fonts.monospace.name = "DejaVu Sans Mono";
  stylix.fonts.monospace.package = pkgs.nerd-fonts.dejavu-sans-mono;

}
