{ pkgs, ... }:
{
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
}
