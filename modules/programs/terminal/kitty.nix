{ ... }:
{
    hm.programs.kitty = {
        enable = true;

        settings = {
            enable_audio_bell = "no";
            visual_bell_duration = 0;
            confirm_os_window_close = 0;
            cursor_shape = "block";
            cursor_shape_unfocused = "hollow";
            cursor_blink_interval = 0;
        };

        shellIntegration.mode = "no-cursor";

        keybindings = {
            "shift+enter" = "send_text all \\u001B[13;2u";
            "ctrl+enter" = "send_text all \\u001B[13;5u";
        };
    };
}
