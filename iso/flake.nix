{
    description = "Bcachefs enabled installation media";
    inputs.nixos.url = "nixpkgs/nixos-unstable";
    outputs =
        { self, nixos }:
        {
            nixosConfigurations = {
                exampleIso = nixos.lib.nixosSystem {
                    system = "x86_64-linux";
                    modules = [
                        "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
                        (
                            { pkgs, ... }:
                            {
                                environment.systemPackages = with pkgs; [
                                    neovim
                                ];
                            }
                        )
                    ];
                };
            };
        };
}
