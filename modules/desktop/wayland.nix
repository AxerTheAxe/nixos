{ pkgs, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  programs.xwayland.enable = true;
  hm = {
    services.cliphist.enable = true;

    home = {
      # Required for ClipHist
      packages = [ pkgs.wl-clipboard ];

      # Runs Electron apps on native Wayland
      sessionVariables.NIXOS_OZONE_WL = "1";
    };
  };
=======
=======
>>>>>>> upstream/main
    programs.xwayland.enable = true;
    hm = {
        services.cliphist.enable = true;

        home = {
            # Required for ClipHist
            packages = [ pkgs.wl-clipboard ];

            # Runs Electron apps on native Wayland
            sessionVariables.NIXOS_OZONE_WL = "1";
        };
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
