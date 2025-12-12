{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-utils
    nixfmt-rfc-style
    nixd
    ki
  ];

  home.sessionVariables = {
    EDITOR = "ki";
    KI_EDITOR_THEME = "Catppuccin Frappé";
    KI_EDITOR_KEYBOARD = "qwerty";
  };

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = "set fish_greeting"; # disable greeting

  programs.yazi.enable = true;
  programs.yazi.settings = {
    mgr.ratio = [
      1
      2
      5
    ];
    preview.max_width = 1500;
    preview.max_height = 1500;
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };
}
