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
            };
        };

        supportedFilesystems = [ "bcachefs" ];

        tmp.cleanOnBoot = true;
    };
}
