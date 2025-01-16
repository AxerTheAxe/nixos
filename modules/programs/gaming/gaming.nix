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
}
