let
<<<<<<< HEAD
<<<<<<< HEAD
  katherine = rec {
    userName = "katherine";
    name = "Katherine Jennifer Jamison";
    email = "axertheaxe@proton.me";
    configDir = "/home/${userName}/NixOS";
  };
in
{
  desktop = {
    channel = "stable";
    module = ./desktop/configuration.nix;

    system = {
      hostName = "nixos-desktop";
      platform = "x86_64-linux";
      timeZone = "America/Denver";
      installVersion = "25.11";
      trashFrequency = "14d";
    };

    user = katherine;
  };
=======
=======
>>>>>>> upstream/main
    katherine = rec {
        userName = "katherine";
        name = "Katherine Jamison";
        email = "axertheaxe@proton.me";
        configDir = "/home/${userName}/NixOS";
    };
in
{
    desktop = {
        channel = "unstable";
        module = ./desktop/configuration.nix;

        system = {
            hostName = "nixos-desktop";
            platform = "x86_64-linux";
            timeZone = "America/Denver";
            installVersion = "25.05";
            trashFrequency = "14d";
        };

        user = katherine;
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
