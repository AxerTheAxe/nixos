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

        # A password must be manually set with passwd
        initialHashedPassword = "";

        extraGroups = [ "wheel" ];
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
    programs.nano.enable = false;

    system.stateVersion = hostOptions.system.installVersion;
}
