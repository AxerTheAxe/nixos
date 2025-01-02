{ pkgs, ... }:
{
    services.xserver = {
        enable = true;

        desktopManager.gnome.enable = true;
        displayManager.gdm = {
            enable = true;
            wayland = true;
        };
    };

    environment.gnome.excludePackages = with pkgs; [
        baobab
        epiphany
        gnome-text-editor
        gnome-calculator
        gnome-calendar
        gnome-characters
        gnome-clocks
        gnome-console
        gnome-contacts
        gnome-disk-utility
        gnome-font-viewer
        gnome-logs
        gnome-maps
        gnome-music
        gnome-system-monitor
        gnome-weather
        loupe
        nautilus
        gnome-connections
        simple-scan
        snapshot
        totem
        yelp
    ];
}
