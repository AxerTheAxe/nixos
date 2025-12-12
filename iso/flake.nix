{
    description = "Bcachefs enabled installation media";
<<<<<<< HEAD
<<<<<<< HEAD
    inputs.nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    outputs =
        { nixos }:
=======
    inputs.nixos.url = "nixpkgs/nixos-unstable";
    outputs =
        { self, nixos }:
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
    inputs.nixos.url = "nixpkgs/nixos-unstable";
    outputs =
        { self, nixos }:
>>>>>>> upstream/main
        {
            nixosConfigurations = {
                exampleIso = nixos.lib.nixosSystem {
                    system = "x86_64-linux";
                    modules = [
                        "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
                        (
<<<<<<< HEAD
<<<<<<< HEAD
                            { lib, pkgs, ... }:
                            {
                                boot.supportedFilesystems = [ "bcachefs" ];
                                boot.kernelPackages = lib.mkOverride 0 pkgs.linuxPackages_latest;

                                environment.systemPackages = with pkgs; [
                                    bcachefs-tools
=======
                            { pkgs, ... }:
                            {
                                environment.systemPackages = with pkgs; [
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
                            { pkgs, ... }:
                            {
                                environment.systemPackages = with pkgs; [
>>>>>>> upstream/main
                                    neovim
                                ];
                            }
                        )
                    ];
                };
            };
        };
}
