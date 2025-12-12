{
    hostOptions,
    modulesPath,
    lib,
    ...
}:
{
    imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        (lib.mkAliasOptionModule [ "user" ] [
            "users"
            "users"
            hostOptions.user.userName
        ])
    ];

    networking.hostName = hostOptions.system.hostName;
    user = {
        isNormalUser = true;
        description = hostOptions.user.name;

<<<<<<< HEAD
<<<<<<< HEAD
        extraGroups = [ "plugdev" ];

=======
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
        initialHashedPassword = "";
    };

    nix.settings.experimental-features = [
        "flakes"
        "nix-command"
    ];

    nixpkgs = {
        config.allowUnfree = true;
        hostPlatform = hostOptions.system.platform;
    };

    # Skips the installation of unneeded packages
    environment.defaultPackages = [ ];
    security.sudo.enable = lib.mkDefault false;
    programs.nano.enable = lib.mkDefault false;

    system.stateVersion = hostOptions.system.installVersion;
}
