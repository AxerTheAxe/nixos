let
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
}
