let
    katherine = rec {
        userName = "katherine";
        name = "Katherine Jamison";
        email = "axertheaxe@proton.me";
        configDir = "/home/${userName}/Nixos";
    };
in
{
    desktop = {
        channel = "unstable";
        module = ./desktop/configuration.nix;

        system = {
            hostName = "desktop";
            platform = "x86_64-linux";
            timeZone = "America/Denver";
            installVersion = "24.11";
            trashFrequency = "14d";
        };

        user = katherine;
    };
}
