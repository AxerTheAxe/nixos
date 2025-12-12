{ pkgs, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
  };
  user.extraGroups = [ "libvirtd" ];
=======
=======
>>>>>>> upstream/main
    virtualisation.libvirtd = {
        enable = true;
        qemu.vhostUserPackages = [ pkgs.virtiofsd ];
    };

    user.extraGroups = [ "libvirtd" ];
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
