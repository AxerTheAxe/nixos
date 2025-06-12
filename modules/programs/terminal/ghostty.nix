{ ... }:
{
    hm.programs.ghostty = {
        enable = true;
        settings = {
            cursor-style = "block";
            cursor-style-blink = false;
            shell-integration-features = "no-cursor";
            confirm-close-surface = false;
            resize-overlay = "never";
            gtk-single-instance = true;
            quit-after-last-window-closed = false;
            keybind = [
                "shift+enter=csi:13;2u"
                "ctrl+enter=csi:13;5u"
            ];
        };
    };
}
