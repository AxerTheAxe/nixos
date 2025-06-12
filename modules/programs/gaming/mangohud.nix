{ ... }:
{
    hm.programs.mangohud = {
        enable = true;

        settings = {
            fps_limit = 100;
            # Smoothest frames
            fps_limit_method = "early";
            show_fps_limit = true;

            af = 16;

            no_display = true;
            round_corners = true;

            cpu_temp = true;
            gpu_temp = true;
            gpu_power = true;
            gpu_mem_temp = true;
            vram = true;
            ram = true;
            swap = true;

            arch = true;
            vulkan_driver = true;
            display_server = true;
            gamemode = true;
            wine = true;
            resolution = true;
        };
    };
}
