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
<<<<<<< HEAD
<<<<<<< HEAD
            settings = {
                disable_netrw = true;
                hijack_netrw = true;

                diagnostics.enable = true;

                sync_root_with_cwd = true;
                respect_buf_cwd = true;

                auto_reload_on_write = true;
                reload_on_bufenter = true;

                update_focused_file = {
                    enable = true;
                    update_root = true;
                };

                actions.open_file.quit_on_open = true;

                on_attach.__raw = ''
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
=======
=======
>>>>>>> upstream/main
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
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
            };
        };
    };
}
