{ hostOptions, pkgs, ... }:
let
    nixosUpgrade =
        with hostOptions.user;
        pkgs.writeShellApplication {
            name = "nixos-upgrade";

            runtimeInputs = with pkgs; [
                coreutils
                gnused
                gnugrep
                nix
                nixos-rebuild
            ];

            text = ''
                if [ "$UID" -ne 0 ]; then
                    echo "This script must be ran with root privilages."
                    exit 1
                fi

                if [ -z "$1" ]; then
                    echo "Please enter the system to upgrade."
                    exit 1
                fi

                if ! nix flake show ${configDir} | sed -r 's/\x1B\[[0-9;]*m//g' | grep -q "$1: NixOS configuration"; then
                    echo "Invalid system." 
                    exit 1
                fi

                set -e
                trap 'exit 1' INT

                nix-channel --update
                nix flake update --flake ${configDir}
                nixos-rebuild switch --flake ${configDir}\#"$1" --upgrade-all
                nix-collect-garbage --delete-older-than ${hostOptions.system.trashFrequency}
                nix store optimise
            '';
        };
in
{
    environment.systemPackages = [ nixosUpgrade ];
}
