<<<<<<< HEAD
<<<<<<< HEAD
{ ... }:
{
  imports = [
    ./gamemode.nix
    ./gamescope.nix
    ./mangohud.nix
    ./steam.nix
    ./prismlauncher.nix
    ./vintagestory.nix
  ];
=======
=======
>>>>>>> upstream/main
{ pkgs, ... }:
{
    imports = [
        ./gamemode.nix
        ./gamescope.nix
        ./mangohud.nix
        ./steam.nix
        ./prismlauncher.nix
    ];

    hm.home.packages = with pkgs; [
        vulkan-tools
        superTux
        superTuxKart
        gnome-nibbles
        quadrapassel
    ];
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
