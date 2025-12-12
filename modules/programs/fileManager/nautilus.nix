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
      terminal = "alacritty";
    };
  };

  environment.systemPackages = with pkgs; [
    nautilus
    unrar-free
  ];

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
  };
}
