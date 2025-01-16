{ pkgs, ... }:
{
    services = {
        xserver.enable = true;
        desktopManager.plasma6.enable = true;
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        dolphin
        ark
        plasma-browser-integration
        konsole
        oxygen
        elisa
        gwenview
        kate
        kwalletmanager
        khelpcenter
        okular
    ];
}
