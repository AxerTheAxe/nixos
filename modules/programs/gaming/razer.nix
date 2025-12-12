{ pkgs, hostOptions, ... }:
{
    hardware.openrazer = {
        enable = true;
        users = [ hostOptions.user.userName ];
    };

    environment.systemPackages = [
        pkgs.polychromatic
    ];
}
