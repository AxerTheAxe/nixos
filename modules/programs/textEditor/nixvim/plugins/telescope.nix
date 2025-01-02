{ pkgs, ... }:
{
    home.packages = [ pkgs.ripgrep ];

    programs.nixvim.plugins.telescope = {
        enable = true;
        keymaps = {
            "<leader>ff" = "find_files";
            "<leader>rf" = "oldfiles";
            "<leader>gf" = "git_files";
            "<leader>bf" = "buffers";
            "<leader>gg" = "live_grep";
        };
        settings.defaults.mappings =
            let
                mappings = {
                    "<C-k>" = "move_selection_previous";
                    "<C-j>" = "move_selection_next";
                    "<C-x>" = "delete_buffer";
                    "<C-u>" = "preview_scrolling_up";
                    "<C-d>" = "preview_scrolling_down";
                };
            in
            {
                n = mappings;
                i = mappings;
            };
    };
}
