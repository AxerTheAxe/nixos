{ ... }:
{
    programs.nixvim = {
        keymaps = [
            {
                action = "<cmd>NvimTreeToggle<cr>";
                key = "<leader>ft";
                mode = "n";
            }
        ];

        plugins.nvim-tree = {
            enable = true;
            disableNetrw = true;
            hijackNetrw = true;

            diagnostics.enable = true;

            syncRootWithCwd = true;
            respectBufCwd = true;

            autoReloadOnWrite = true;
            reloadOnBufenter = true;

            updateFocusedFile = {
                enable = true;
                updateRoot = true;
            };

            actions.openFile.quitOnOpen = true;

            onAttach.__raw = ''
                function(buffer)
                    local nvim_tree_api = require("nvim-tree.api")

                    local function binding_options(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = buffer, noremap = true, silent = true, nowait = true }
                    end

                    nvim_tree_api.config.mappings.default_on_attach(buffer)

                    -- Enter a directory
                    vim.keymap.set("n", "<S-CR>", nvim_tree_api.tree.change_root_to_node, binding_options("CD"))

                    -- Move back a directory
                    vim.keymap.set("n", "<C-CR>", "<cmd>cd ../<CR>", binding_options("CD"))

                end
            '';

            view = {
                width = 40;

                number = true;
                relativenumber = true;
            };
        };
    };
}
