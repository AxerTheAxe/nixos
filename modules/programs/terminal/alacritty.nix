{ lib, ... }:
{
  hm.programs.alacritty = {
    enable = true;
    settings = {
      font.size = lib.mkForce 17;
      keyboard.bindings = [
        {
          key = "Enter";
          mods = "Shift";
          chars = "\\u001B[13;2u";
        }
        {
          key = "Enter";
          mods = "Control";
          chars = "\\u001B[13;5u";
        }
      ];
    };
  };
}
