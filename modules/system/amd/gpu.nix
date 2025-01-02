{ pkgs, ... }:
{
    hardware.graphics = with pkgs; {
        enable = true;
        enable32Bit = true;

        extraPackages = [ amdvlk ];
        extraPackages32 = [ driversi686Linux.amdvlk ];
    };

    boot.kernelModules = [ "amdgpu" ];
}
