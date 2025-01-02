{
    inputs,
    hostOptions,
    lib,
    ...
}:
{
    imports = [
        inputs."home-manager-${hostOptions.channel}".nixosModules.home-manager
        (lib.mkAliasOptionModule [ "hm" ] [
            "home-manager"
            "users"
            hostOptions.user.userName
        ])
    ];

    hm = {
        programs.home-manager.enable = true;

        home = {
            username = hostOptions.user.userName;
            homeDirectory = "/home/${hostOptions.user.userName}";
            stateVersion = hostOptions.system.installVersion;
        };
    };

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        # backupFileExtension = "rebuild";
    };
}
