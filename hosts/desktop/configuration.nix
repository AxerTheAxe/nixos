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

        ../../modules/desktop/windowManager/hyprland.nix
        ../../modules/desktop/xdg.nix

        ../../modules/programs/utility/deskExec.nix

        ../../modules/programs/terminal/kitty.nix

        ../../modules/programs/fileManager/nautilus.nix
        ../../modules/programs/webBrowser/firefox.nix
        ../../modules/programs/video/vlc.nix
        ../../modules/programs/video/obs.nix

        ../../modules/programs/communication/discord.nix

        ../../modules/programs/gaming/steam.nix
        ../../modules/programs/gaming/prismlauncher.nix
        ../../modules/programs/gaming/gamemode.nix
        ../../modules/programs/gaming/mangohud.nix
        ../../modules/programs/gaming/gamescope.nix

        ../../modules/programs/virualisation/virtManager.nix

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

    # Switch to Disko if I ever get another NVME for game storage
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
                fsType = "ext4";
            };

            "/boot" = {
                label = "BOOT";
                fsType = "vfat";
            };

            "/mnt/wdb1" = {
                label = "WDB1";
                fsType = "ext4";
                options = options;
            };

            "/mnt/games" = {
                label = "GAMES";
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
