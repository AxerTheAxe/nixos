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
        configurationLimit = 3;
      };
    };

    initrd.systemd.enable = true;
    supportedFilesystems = [ "bcachefs" ];
    tmp.cleanOnBoot = true;
  };
}
