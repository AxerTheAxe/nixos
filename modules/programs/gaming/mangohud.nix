{ ... }:
{
    hm.programs.mangohud = {
        enable = true;

        settings = {
            # Have a setting somewhere that defines refresh rate, and set this to it
            fps_limit = 100;

            gpu_stats = true;
            gpu_temp = true;
            gpu_power = true;
            cpu_stats = true;
            cpu_temp = true;
            vram = true;
            ram = true;
            fps = true;
            frametime = true;
            vulkan_driver = true;
            arch = true;
            frame_timing = true;
            gamemode = true;
            show_fps_limit = true;
            round_corners = 10;
            no_display = true;
            toggle_hud = "Shift_L+F9";
            toggle_fps_limit = "Shift_L+F10";
        };
    };
}
