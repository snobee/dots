{ ... }:
{
  targets.darwin.copyApps.enable = true;
  targets.darwin.linkApps.enable = false;

  programs.ghostty.package = null;
  programs.fish.loginShellInit = "source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish";
}
