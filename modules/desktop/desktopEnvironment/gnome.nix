{ pkgs, ... }:
{
    services.xserver = {
        enable = true;
        desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = with pkgs; [
        orca
        evince
        file-roller
        geary
        gnome-disk-utility
        seahorse
        sushi
        sysprof
        gnome-shell-extensions
        adwaita-icon-theme
        gnome-backgrounds
        gnome-bluetooth
        gnome-color-manager
        gnome-control-center
        gnome-shell-extensions
        gnome-tour
        gnome-user-docs
        glib
        gnome-menus
        gtk3.out
        xdg-user-dirs
        xdg-user-dirs-gtk
        baobab
        epiphany
        gnome-text-editor
        gnome-calculator
        gnome-calendar
        gnome-characters
        gnome-clocks
        gnome-console
        gnome-contacts
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
        gnome-software
    ];
}
