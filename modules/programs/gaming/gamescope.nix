{ ... }:
{
    programs.gamescope = {
        enable = true;
        capSysNice = true;

        # Forces GameScope to use RADV, which is required for it to work
        env.VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
    };
}
