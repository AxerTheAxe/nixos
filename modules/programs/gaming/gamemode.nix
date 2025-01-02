{ lib, ... }:
{
    programs.gamemode =
        let
            overclock = false;
        in
        {
            enable = true;

            settings.gpu = lib.mkIf overclock {
                apply_gpu_optimisations = "accept-responsibility";
                amd_performance_level = "high";
            };
        };
}
