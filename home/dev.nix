{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    python313
    roc
    texlab
    tectonic
    lsp-ai
    gleam
    erlang_27
  ];

  /*
    home.sessionPath = [ "$HOME/.local/bin" ];
    home.file = {
      ".local/bin/" = {
        source = ../bin;
        recursive = true;
      };
    };
  */

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

}
