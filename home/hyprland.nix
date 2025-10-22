{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify # notifications
    mako # notifications

    eww # status bar
    brightnessctl # eww brightness control

    better-control # control panel
    # socat # needed bor better-control?
    glib # needed for better-control?
  ];

  services.hyprpaper.enable = true;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings =
    let
      mod = "SUPER";
      ws_keys = [
        "A"
        "S"
        "D"
        "F"
        "G"
      ];
    in
    {
      misc.disable_hyprland_logo = true;

      input.kb_options = "caps:escape";
      input.touchpad.tap-and-drag = false;

      cursor.hide_on_key_press = true;
      cursor.hide_on_touch = true;

      monitor = [ "eDP-1, 2736x1824, 0x0, 2" ];

      general.gaps_out = 10;

      bind = [
        "${mod}, Return, exec, ghostty +new-window -e fish"
        "${mod}, Q, killactive"
        "${mod}, Space, exec,  ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs hyprctl dispatch exec -- "

        "${mod}, H, movefocus, left"
        "${mod}, J, movefocus, down"
        "${mod}, K, movefocus, up"
        "${mod}, L, movefocus, right"

        "${mod} Shift, H, movewindow, left"
        "${mod} Shift, J, movewindow, down"
        "${mod} Shift, K, movewindow, up"
        "${mod} Shift, L, movewindow, right"

        "${mod}, E, fullscreen, 0"
        "${mod} Shift, W, togglefloating"
      ]
      ++ (lib.lists.imap1 (i: key: "${mod}      , ${key}, workspace      , ${toString i}") ws_keys)
      ++ (lib.lists.imap1 (i: key: "${mod} Shift, ${key}, movetoworkspace, ${toString i}") ws_keys);

      bindle = [
        "     , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +10%"
        "     , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -10%"
        "Shift, XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%"
        "Shift, XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%"
        "     , XF86AudioMute       , exec, pactl set-sink-mute   @DEFAULT_SINK@ toggle"
      ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 4;
        workspace_swipe_cancel_ratio = 0.2;
        workspace_swipe_touch = true;
        workspace_swipe_direction_lock = false;
      };

      animations = {
        bezier = "workspaces, 0.5, 0, 0, 1";
        animation = [
          "workspaces, 1, 1, workspaces"
          "windows, 1, 1, default, slide"
        ];
      };
    };
}
