{ ... }:
{
    hm.programs.mangohud = {
        enable = true;

        settings = {
            fps_limit = 100;

            af = 16;

            no_display = true;
            round_corners = true;

            cpu_power = true;
            cpu_temp = true;
            gpu_temp = true;
            gpu_power = true;
            gpu_mem_temp = true;
            ram = true;
            swap = true;

            arch = true;
            vulkan_driver = true;
            gamemode = true;
            wine = true;
            resolution = true;
        };
    };
}
