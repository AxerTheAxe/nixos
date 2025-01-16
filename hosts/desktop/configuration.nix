{ pkgs, ... }:
{
    imports = [
        ../../modules/nixos/nixos.nix
        ../../modules/nixos/homeManager.nix

        ../../modules/system/amd/cpu.nix
        ../../modules/system/amd/gpu.nix
        ../../modules/system/efi/boot.nix
        ../../modules/system/locale.nix
        ../../modules/system/network.nix
        ../../modules/system/bluetooth.nix

        ../../scripts/nixosUpgrade.nix

        ../../modules/programs/shell/zsh.nix
        ../../modules/programs/shell/zoxide.nix
        ../../modules/programs/shell/fastfetch.nix
        ../../modules/programs/textEditor/nixvim/nixvim.nix
        ../../modules/programs/utility/deskExec.nix
        ../../modules/programs/terminal/kitty.nix
        ../../modules/programs/fileManager/nautilus.nix
        ../../modules/programs/webBrowser/firefox.nix
        ../../modules/programs/video/vlc.nix
        ../../modules/programs/video/obs.nix
        ../../modules/programs/communication/discord.nix
        ../../modules/programs/gaming/gaming.nix
        ../../modules/programs/virualisation/virtManager.nix

        ../../modules/desktop/xdg.nix
        ../../modules/desktop/displayManager/sddm.nix
        ../../modules/desktop/desktopEnvironment/plasma.nix
        ../../modules/desktop/windowManager/hyprland.nix

        # Configurable
        ../../modules/audio/audio.nix
        ../../modules/programs/development/git.nix

        # Temporary
        ./stylix-temp.nix
    ];

    # Make a wrapper script that launches games with addons only if they are available
    hm.xdg.desktopEntries.prismlauncher = {
        name = "prismlauncher";
        exec = "gamemoderun mangohud --dlsym prismlauncher %U";
        genericName = "minecraft";
        settings.Keywords = "game;minecraft;mc";
    };

    hm.xdg.desktopEntries.steam = {
        name = "steam";
        exec = "gamemoderun mangohud steam %U";
        genericName = "steam";
        settings.Keywords = "game;valve;steam";
    };

    audio = {
        enable = true;
        outputs = [
            {
                name = "alsa_output.usb-Razer_Razer_Kraken_Ultimate_00000000-00.analog-stereo";
                volume = 85;
                virtual = [
                    {
                        name = "primary";
                        volume = 75;
                        default = true;
                    }
                    {
                        name = "secondary";
                        volume = 75;
                    }
                ];
            }
        ];
    };

    git = {
        enable = true;
        ssh =
            let
                keyFile = "~/.ssh/keys/mainkey";
            in
            {
                enable = true;
                publicKey = "${keyFile}.pub";
                privateKey = keyFile;
            };
    };

    fileSystems =
        let
            options = [
                "users"
                "nofail"
                "exec"
            ];
        in
        {
            "/" = {
                label = "ROOT";
                fsType = "bcachefs";
            };

            "/boot" = {
                label = "BOOT";
                fsType = "vfat";
                options = [ "umask=0077" ];
            };

            "/mnt/games" = {
                label = "GAMES";
                fsType = "bcachefs";
                options = options;
            };

            "/mnt/wdb1" = {
                label = "WDB1";
                fsType = "ext4";
                options = options;
            };
        };

    swapDevices = [ { label = "SWAP"; } ];

    boot = {
        # Generated from 'nixos-generate-config'
        initrd.availableKernelModules = [
            "nvme"
            "xhci_pci"
            "ahci"
            "usbhid"
            "sd_mod"
        ];

        kernelPackages = pkgs.linuxPackages_latest;
    };
}
