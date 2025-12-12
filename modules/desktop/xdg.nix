{ pkgs, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  hm.xdg = {
    portal =
      let
        portals = with pkgs; [
          xdg-desktop-portal-gtk
          kdePackages.xdg-desktop-portal-kde
        ];
      in
      {
        enable = true;
        configPackages = portals;
        extraPortals = portals;
      };

    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
=======
=======
>>>>>>> upstream/main
    hm.xdg = {
        portal =
            let
                portals = with pkgs; [
                    xdg-desktop-portal-gtk
                    kdePackages.xdg-desktop-portal-kde
                ];
            in
            {
                enable = true;
                configPackages = portals;
                extraPortals = portals;
            };

        userDirs = {
            enable = true;
            createDirectories = true;
        };
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
