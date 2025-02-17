{ pkgs, ... }:
{
    virtualisation.libvirtd = {
        enable = true;
        qemu.vhostUserPackages = [ pkgs.virtiofsd ];
    };

    user.extraGroups = [ "libvirtd" ];
}
