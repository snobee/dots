{ pkgs, ... }:
{
  home.packages = with pkgs; [
  ];

  gtk.enable = true;

  programs.zathura.enable = true;
  programs.zathura.options = {
    window-title-basename = "true";
    selection-clipboard = "clipboard";

    render-loading = "true";

    guioptions = ""; # remove statusbar
    adjust-open = "width"; # open sized to width

    first-page-column = "1";
    database = "sqlite";
  };

  services.syncthing.enable = true;
}
