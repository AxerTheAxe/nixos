{ ... }:
{
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
    boot.kernelModules = [ "amdgpu" ];
}
