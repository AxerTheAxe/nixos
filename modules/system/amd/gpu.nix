{ ... }:
{
    hardware.graphics = {
        enable = true;
        enable32Bit = true;

        # extraPackages = [ pkgs.amdvlk ];
        # extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    };

    boot.kernelModules = [ "amdgpu" ];
}
