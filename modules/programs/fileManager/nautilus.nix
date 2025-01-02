{ pkgs, ... }:
{
    programs = {
        # Required for file picker
        dconf.enable = true;

        nautilus-open-any-terminal = {
            enable = true;
            # Add a terminal module which defines the default terminal
            terminal = "kitty";
        };
    };
    environment.systemPackages = [ pkgs.nautilus ];

    # Required for trash
    services.gvfs.enable = true;

    hm.dconf = {
        enable = true;
        settings."org/gnome/nautilus/prefrences".enable-delete = true;
    };

    xdg.mime = {
        enable = true;
        defaultApplications."inode/directory" = "org.gnome.Nautilus.desktop";
    };
}
