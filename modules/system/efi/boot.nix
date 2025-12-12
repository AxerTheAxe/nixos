{ ... }:
{
    boot = {
        kernelParams = [
            "rw"
            "quiet"
            "loglevel=3"
            "nowatchdog"
        ];

        loader = {
            timeout = 0;
            efi.canTouchEfiVariables = true;

            systemd-boot = {
                enable = true;
                editor = false;
<<<<<<< HEAD
<<<<<<< HEAD
		configurationLimit = 3;
            };
        };

        initrd.systemd.enable = true;

=======
            };
        };

>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
            };
        };

>>>>>>> upstream/main
        supportedFilesystems = [ "bcachefs" ];

        tmp.cleanOnBoot = true;
    };
}
