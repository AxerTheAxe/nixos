{
    pkgs,
    ...
}:
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

    hm = {
        dconf = {
            enable = true;
            settings."org/gnome/nautilus/preferences".show-delete-permanently = true;
        };

        xdg.mimeApps = {
            enable = true;
            defaultApplications."inode/directory" = "org.gnome.Nautilus.desktop";
        };

        home.file."Templates/blank" = {
            enable = true;
            text = "";
        };

        systemd.user.services.gtk-bookmarks.Service.ExecStart =
            let
                name = "gtk-bookmarks";
            in
            pkgs.writeShellApplication {
                inherit name;
                runtimeInputs = with pkgs; [
                    inotify-tools
                    xdg-user-dirs-gtk
                ];
                text = ''
                    rm -f ~/.config/gtk-3.0/bookmarks
                    xdg-user-dirs-gtk-update
                    sort -o ~/.config/gtk-3.0/bookmarks ~/.config/gtk-3.0/bookmarks
                    dirs=$(find /mnt -mindepth 1 -maxdepth 1 -type d -exec echo "file://{}" \;)
                    dirs="$dirs
                    file:///"
                    mkdir -p ~/.config/gtk-3.0
                    echo "$dirs" >> ~/.config/gtk-3.0/bookmarks
                '';
            }
            + "/bin/${name}";
    };
}
