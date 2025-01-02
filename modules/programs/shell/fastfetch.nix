{ pkgs, ... }:
{
    environment.shellInit = "${pkgs.fastfetch}/bin/fastfetch";

    hm.programs.fastfetch = {
        enable = true;

        settings = {
            logo.type = "small";
            display.separator = "    ";

            modules = [
                {
                    "type" = "custom";
                    "format" = "┌─────────── Software Information ───────────┐";
                }

                {
                    "type" = "title";
                    "key" = "  ";
                    "format" = "{1}@{2}";
                }

                {
                    "type" = "os";
                    "key" = "  ";
                    "format" = "{3}";
                }

                {
                    "type" = "kernel";
                    "key" = "  ";
                }

                {
                    "type" = "packages";
                    "key" = "  󰏖";
                }

                {
                    "type" = "shell";
                    "key" = "  ";
                }

                {
                    "type" = "uptime";
                    "key" = "  󰅐";
                }

                {
                    "type" = "custom";
                    "format" = "├─────────── Hardware Information ───────────┤";
                }

                {
                    "type" = "cpu";
                    "key" = "  󰻠";
                    "format" = "{1}";
                }

                {
                    "type" = "gpu";
                    "key" = "  󰍛";
                    "format" = "{2}";
                }

                {
                    "type" = "memory";
                    "key" = "  󰑭";
                    "format" = "{1} / {2}";
                }

                {
                    "type" = "custom";
                    "format" = "└────────────────────────────────────────────┘";
                }

                {
                    "type" = "colors";
                    "paddingLeft" = 2;
                    "symbol" = "circle";
                }

                "break"
            ];
        };
    };
}
