{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      monitor = [
        "eDP-1,2560x1600@60,0x0,1.6"
        "DP-1,preferred,-400x-1350,1.6"
        "DP-2,preferred,auto,1"
        "HDMI-A-1,preferred,-480x-1080,1"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us, jp";
        kb_variant = "qwerty";
        kb_options = "grp:caps_toggle";

        follow_mouse = 1;
        repeat_rate = 25;
        repeat_delay = 200;
        sensitivity = 0.2;
        scroll_method = "2fg";

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.2;
        };
      };

      xwayland = {
        force_zero_scaling = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        allow_tearing = false;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = true;
        };

        #drop_shadow = true;
        #shadow_range = 4;
        #shadow_render_power = 3;
        #"col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        force_split = 2;
        smart_split = false;
        preserve_split = true; # preserve_split is set to true automatically
        smart_resizing = true;
      };

      master = {
        smart_resizing = true;
        mfact = 0.5;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = true;
        workspace_swipe_distance = 300;
        workspace_swipe_forever = true;
      };

      misc = {
        force_default_wallpaper = 0;
      };

      windowrulev2 = [
        "tile, class:^(Floorp)$"
        "tile, class:^(firefox)$"
        "tile, class:^(kitty)$"
      ];

      exec-once = [
        "swww init" # Idk why but swww-daemon doesn't work well
        "swww img ~/Pictures/wallpaper/w3.jpg"
        "waybar"
        "fcitx5"
        "mako"
        "fusuma"
      ];

      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, T, exec, kitty"
        "$mainMod, C, killactive"
        "$mainMod, esc, exit,"
        "$mainMod, E, exec, kitty ranger"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, rofi -show drun -show-icons -auto-close"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, F, fullscreen"
        "$mainMod, F5, exec, pactl set-sink-volume "

        "$mainMod, F5, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        "$mainMod, F4, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        "$mainMod, F3, exec, pactl set-sink @DEFAULT_SINK 0%"
        "$mainMod, F2, exec, brightnessctl s 5%+"
        "$mainMod, F1, exec, brightnessctl s 5%-"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "ALT_L, mouse:276, workspace, e+1" # side button up
        "ALT_L, mouse:275, workspace, e-1" # side button down
        # left mouse button: 272
        # right mouse button: 273

        "$mainMod SHIFT, F12, exec, sh $HOME/.scripts/grimhere/grimhere.sh"
        "$mainMod, F12, exec, grim $HOME/Pictures/screenshot/tmp.png"

        "$mainMod, h, exec, pkill -SIGUSR1 waybar"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
