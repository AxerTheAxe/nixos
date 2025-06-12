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
        # ../../modules/system/bluetooth.nix
        ../../modules/system/doas.nix

        ../../scripts/nixosUpgrade.nix

        ../../modules/programs/shell/zsh.nix
        ../../modules/programs/shell/zoxide.nix
        ../../modules/programs/shell/fastfetch.nix
        ../../modules/programs/textEditor/nixvim/nixvim.nix
        ../../modules/programs/utility/deskExec.nix
        ../../modules/programs/development/man.nix
        ../../modules/programs/terminal/kitty.nix
        ../../modules/programs/fileManager/nautilus.nix
        ../../modules/programs/webBrowser/firefox.nix
        ../../modules/programs/image/krita.nix
        ../../modules/programs/video/vlc.nix
        ../../modules/programs/video/obs.nix
        ../../modules/programs/video/kdenlive.nix
        ../../modules/programs/communication/discord.nix
        ../../modules/programs/gaming/gaming.nix
        # ../../modules/programs/virtualization/virtManager.nix

        ../../modules/desktop/xdg.nix
        ../../modules/desktop/windowManager/hyprland.nix

        # Configurable
        ../../modules/audio/audio.nix
        ../../modules/programs/development/git.nix

        # Temporary
        ./stylix-temp.nix
    ];

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
            base_options = [
                "rw"
                "exec"
                "noatime"
                "nodiratime"
            ];

            external_options = [
                "nofail"
            ];
        in
        {
            "/" = {
                label = "ROOT";
                fsType = "bcachefs";
                options = base_options;
            };

            "/boot" = {
                label = "BOOT";
                fsType = "vfat";
                options = [ "umask=0077" ];
            };

            "/mnt/games" = {
                label = "GAMES";
                fsType = "bcachefs";
                options = base_options ++ external_options;
            };

            "/mnt/wdb1" = {
                label = "WDB1";
                fsType = "ext4";
                options = base_options ++ external_options;
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
        kernel.sysctl."vm.swapiness" = 5;

        kernelPackages = pkgs.linuxPackages_lqx;
    };
}
