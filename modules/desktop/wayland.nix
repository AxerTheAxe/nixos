{ pkgs, ... }:
{
    hm= {
        services.cliphist.enable = true;

        home = {
            # Required for ClipHist
            packages = [ pkgs.wl-clipboard ];

            # Runs Electron apps on native Wayland
            sessionVariables.NIXOS_OZONE_WL = "1";
        };
    };
}
