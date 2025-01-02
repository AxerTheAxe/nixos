{ ... }:
{
    programs.nixvim = {
        keymaps = [
            {
                action = "<cmd>UndotreeToggle<cr>";
                key = "<leader>u";
                mode = "n";
            }
        ];

        plugins.undotree = {
            enable = true;
            settings = {
                WindowLayout = 3;
                SplitWidth = 40;
                SetFocusWhenToggle = true;
            };
        };
    };
}
