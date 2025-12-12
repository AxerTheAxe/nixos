{ pkgs, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  imports = [
    ../wayland.nix
    ../fonts.nix
  ];

  programs.hyprland.enable = true;
  hm = {
    home.packages = [ pkgs.hyprshot ];
    wayland.windowManager.hyprland = {
      enable = true;

      # REDO SETTINGS FROM SCRATCH
      settings = {
        "$priMonitor" = "DP-3";
        "$secMonitor" = "HDMI-A-1";

        # Won't use the alias
        "$terminal" = "alacritty";

        "$mod" = "SUPER";
        "$altMod" = "$mod ALT";
        "$shiftMod" = "$mod SHIFT";
        "$ctrlMod" = "$mod CONTROL";

        "$pink" = "rgb(f5c2e7)";
        "$crust" = "rgb(11111b)";

        monitor = [
          "$secMonitor, 1920x1080@75, 0x0, 1"
          "$priMonitor, 2560x1080@100, 1920x0, 1"
        ];

        general = {
          no_focus_fallback = true;

          border_size = 2;
        };

        cursor = {
          no_warps = true;
        };

        decoration = {
          rounding = 12;
        };

        animations = {
          animation = [
            "workspaces, 1, 5, default"
            "windows, 1, 4, default, popin 50%"
            "windowsOut, 1, 4, default, popin 50%"
            "windowsMove, 1, 4, default, popin 50%"
          ];
        };

        input = {
          numlock_by_default = true;
          accel_profile = "flat";
          follow_mouse = 2;
          sensitivity = 0.0;

          # MAY CAUSE ISSUES WITH MOUSE INPUT
          # DISABLE IF HAVING ISSUES
          force_no_accel = true;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          mouse_move_focuses_monitor = false;
          new_window_takes_over_fullscreen = 2;
        };

        dwindle = {
          force_split = 2;
        };

        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };

        bind = [
          "$mod, c, killactive"
          "$mod, f, togglefloating"
          "$mod, m, fullscreen"

          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"
          "$altMod, h, workspace, r-1"
          "$altMod, l, workspace, r+1"
          "$altMod, p, movetoworkspace, r-1"
          "$altMod, n, movetoworkspace, r+1"
          "$shiftMod, h, movewindow, mon:$secMonitor"
          "$shiftMod, l, movewindow, mon:$priMonitor"
          "$ctrlMod, h, movewindow, l"
          "$ctrlMod, j, movewindow, d"
          "$ctrlMod, k, movewindow, u"
          "$ctrlMod, l, movewindow, r"

          "$mod, left, movefocus, l"
          "$mod, down, movefocus, d"
          "$mod, up, movefocus, u"
          "$mod, right, movefocus, r"
          "$altMod, left, workspace, r-1"
          "$altMod, right, workspace, r+1"
          "$altMod, mouse_up, workspace, r-1"
          "$altMod, mouse_down, workspace, r+1"
          "$altMod, down, movetoworkspace, r-1"
          "$altMod, up, movetoworkspace, r+1"
          "$shiftMod, left, movewindow, mon:$secMonitor"
          "$shiftMod, right, movewindow, mon:$priMonitor"
          "$ctrlMod, left, movewindow, l"
          "$ctrlMod, down, movewindow, d"
          "$ctrlMod, up, movewindow, u"
          "$ctrlMod, right, movewindow, r"

          "$mod, t, exec, $terminal"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        exec-once = [
          "${pkgs.hyprpaper}/bin/hyprpaper"
          "eww open topbar"
          "hyprctl dispatch movecursor 3195 535"
          "hyprctl dispatch focusmonitor DP-3"
        ];

        windowrulev2 = [
          "tile,title:(Godot)"

          "tile,class:(Minecraft),title:(Minecraft)"
          "fullscreen,class:(Minecraft),title:(Minecraft)"

          "tile,class:(hl_linux),title:(Half-Life)"
          "fullscreen,class:(hl_linux),title:(Half-Life)"
        ];
      };
    };

    xdg.portal =
      let
        portals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-hyprland
        ];
      in
      {
        enable = true;
        configPackages = portals;
        extraPortals = portals;
      };

    services.hyprpaper = {
      enable = true;
      settings.splash = false;
    };
  };
=======
=======
>>>>>>> upstream/main
    imports = [
        ../wayland.nix
        ../fonts.nix
    ];

    programs.hyprland.enable = true;
    hm = {
        home.packages = [ pkgs.hyprshot ];
        wayland.windowManager.hyprland = {
            enable = true;

            # REDO SETTINGS FROM SCRATCH
            settings = {
                "$priMonitor" = "DP-3";
                "$secMonitor" = "HDMI-A-1";

                # Won't use the alias
                "$terminal" = "kitty --single-instance";

                "$mod" = "SUPER";
                "$altMod" = "$mod ALT";
                "$shiftMod" = "$mod SHIFT";
                "$ctrlMod" = "$mod CONTROL";

                "$pink" = "rgb(f5c2e7)";
                "$crust" = "rgb(11111b)";

                monitor = [
                    "$secMonitor, 1920x1080@75, 0x0, 1"
                    "$priMonitor, 2560x1080@100, 1920x0, 1"
                ];

                general = {
                    no_focus_fallback = true;

                    border_size = 2;
                };

                cursor = {
                    no_warps = true;
                };

                decoration = {
                    rounding = 12;
                };

                animations = {
                    animation = [
                        "workspaces, 1, 5, default"
                        "windows, 1, 4, default, popin 50%"
                        "windowsOut, 1, 4, default, popin 50%"
                        "windowsMove, 1, 4, default, popin 50%"
                    ];
                };

                input = {
                    numlock_by_default = true;
                    accel_profile = "flat";
                    follow_mouse = 2;

                    # MAY CAUSE ISSUES WITH MOUSH INPUT
                    # DISABLE IF HAVING ISSUES
                    force_no_accel = true;
                };

                misc = {
                    disable_hyprland_logo = true;
                    disable_splash_rendering = true;
                    mouse_move_focuses_monitor = false;
                    new_window_takes_over_fullscreen = 2;
                };

                dwindle = {
                    force_split = 2;
                };

                ecosystem = {
                    no_update_news = true;
                    no_donation_nag = true;
                };

                bind = [
                    "$mod, c, killactive"
                    "$mod, f, togglefloating"
                    "$mod, m, fullscreen"

                    "$mod, h, movefocus, l"
                    "$mod, j, movefocus, d"
                    "$mod, k, movefocus, u"
                    "$mod, l, movefocus, r"
                    "$altMod, h, workspace, r-1"
                    "$altMod, l, workspace, r+1"
                    "$altMod, p, movetoworkspace, r-1"
                    "$altMod, n, movetoworkspace, r+1"
                    "$shiftMod, h, movewindow, mon:$secMonitor"
                    "$shiftMod, l, movewindow, mon:$priMonitor"
                    "$ctrlMod, h, movewindow, l"
                    "$ctrlMod, j, movewindow, d"
                    "$ctrlMod, k, movewindow, u"
                    "$ctrlMod, l, movewindow, r"

                    "$mod, left, movefocus, l"
                    "$mod, down, movefocus, d"
                    "$mod, up, movefocus, u"
                    "$mod, right, movefocus, r"
                    "$altMod, left, workspace, r-1"
                    "$altMod, right, workspace, r+1"
                    "$altMod, down, movetoworkspace, r-1"
                    "$altMod, up, movetoworkspace, r+1"
                    "$shiftMod, left, movewindow, mon:$secMonitor"
                    "$shiftMod, right, movewindow, mon:$priMonitor"
                    "$ctrlMod, left, movewindow, l"
                    "$ctrlMod, down, movewindow, d"
                    "$ctrlMod, up, movewindow, u"
                    "$ctrlMod, right, movewindow, r"

                    "$mod, t, exec, $terminal"
                ];

                bindm = [
                    "$mod, mouse:272, movewindow"
                    "$mod, mouse:273, resizewindow"
                ];

                exec-once = [
                    "${pkgs.hyprpaper}/bin/hyprpaper"
                    "eww open topbar"
                    "hyprctl dispatch movecursor 3195 535"
                    "hyprctl dispatch focusmonitor DP-3"
                ];

                windowrulev2 = [
                    "tile,title:(Godot)"

                    "tile,class:(Minecraft),title:(Minecraft)"
                    "fullscreen,class:(Minecraft),title:(Minecraft)"

                    "tile,class:(hl_linux),title:(Half-Life)"
                    "fullscreen,class:(hl_linux),title:(Half-Life)"
                ];
            };
        };

        xdg.portal =
            let
                portals = with pkgs; [
                    xdg-desktop-portal-gtk
                    xdg-desktop-portal-hyprland
                ];
            in
            {
                enable = true;
                configPackages = portals;
                extraPortals = portals;
            };

        services.hyprpaper = {
            enable = true;
            settings.splash = false;
        };
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
