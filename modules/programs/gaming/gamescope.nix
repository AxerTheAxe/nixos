{ ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
=======
=======
>>>>>>> upstream/main
    programs.gamescope = {
        enable = true;
        capSysNice = true;

        # Forces GameScope to use RADV, which is required for it to work
        env.VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
