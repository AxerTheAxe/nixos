{
<<<<<<< HEAD
<<<<<<< HEAD
  hostOptions,
  inputs,
  pkgs,
  ...
}:
{
  # Install Neovim system wide
  imports = [ ../neovim.nix ];

  hm = {
    imports = [
      inputs."nixvim-${hostOptions.channel}".homeModules.nixvim

      # Plugins with large configurations are defined in their own modules
      ./plugins/telescope.nix
      ./plugins/nvimTree.nix
      ./plugins/undoTree.nix
      ./plugins/lsp.nix
    ];

    programs.nixvim = {
      enable = true;

      nixpkgs.useGlobalPackages = true;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      luaLoader.enable = true;

      plugins = {
        nvim-autopairs.enable = true;
        # lualine.enable = true;
        crates.enable = true;
        web-devicons.enable = true;
        treesitter = {
          enable = true;
          settings.highlight.enable = true;
        };
        markdown-preview.enable = true;
      };

      extraPlugins = with pkgs.vimPlugins; [
        {
          plugin = term-edit-nvim;
          config = ''lua require('term-edit').setup({prompt_end = '%$'})'';
        }
      ];

      opts = {
        autochdir = true;
        swapfile = false;
        backup = false;
        undofile = true;
        shortmess = "I";
        termguicolors = true;
        guicursor = "";
        cursorline = true;
        number = true;
        relativenumber = true;
        autoindent = true;
        cindent = true;
        expandtab = true;
        softtabstop = 4;
        shiftwidth = 4;
        incsearch = true;
        hlsearch = false;
        spell = true;
      };
      globals.mapleader = " ";

      keymaps = [
        {
          action = "o<esc>O";
          key = "<leader>o";
          mode = "n";
        }
        {
          action = "<C-u>zzzz";
          key = "<C-u>";
          mode = "n";
        }
        {
          action = "<C-d>zzzz";
          key = "<C-d>";
          mode = "n";
        }
        {
          action = "Gzzzz";
          key = "G";
          mode = "n";
        }
        {
          action = "mzJ`z";
          key = "J";
          mode = "n";
        }

        {
          action = "<C-R>";
          key = "U";
          mode = "n";
        }

        {
          action = "<cmd>%y<CR>";
          key = "ya";
          mode = "n";
        }

        {
          action = "\"+y";
          key = "<leader>y";
          mode = "";
        }
        {
          action = "\"+y$";
          key = "<leader>Y";
          mode = "";
        }

        {
          action = "<cmd>%y+<CR>";
          key = "<leader>ya";
          mode = "n";
        }

        {
          action = "\"_dP";
          key = "p";
          mode = "x";
        }

        {
          action = "\"+p";
          key = "<leader>p";
          mode = "";
        }
        {
          action = "\"+P";
          key = "<leader>P";
          mode = "";
        }

        {
          action = "<cmd>%d<CR>";
          key = "da";
          mode = "n";
        }

        {
          action = "\"+d";
          key = "<leader>d";
          mode = "";
        }
        {
          action = "\"+d$";
          key = "<leader>D";
          mode = "";
        }

        {
          action = "<cmd>%d+<CR>";
          key = "<leader>da";
          mode = "n";
        }

        {
          action = "<cmd>w<CR>";
          key = "<leader>w";
          mode = "n";
        }

        {
          action = "<cmd>wq<CR>";
          key = "<leader>q";
          mode = "n";
        }

        {
          action = "nzzzz";
          key = "n";
          mode = "n";
        }
        {
          action = "Nzzzz";
          key = "N";
          mode = "n";
        }

        {
          action = ":%s/";
          key = "<leader>/";
          mode = "n";
        }
        {
          action = ":s/\\%V";
          key = "<leader>/";
          mode = "x";
        }

        {
          action = "<cmd>bdelete!<CR>";
          key = "<leader>bd";
          mode = "n";
        }

        {
          action = "<cmd>term<CR>";
          key = "<leader>t";
          mode = "n";
        }

        {
          action = "<C-\\><C-n>";
          key = "<Esc>";
          mode = "t";
        }

        {
          action = "<C-w>h";
          key = "<leader>h";
          mode = "n";
        }
        {
          action = "<C-w>j";
          key = "<leader>j";
          mode = "n";
        }
        {
          action = "<C-w>k";
          key = "<leader>k";
          mode = "n";
        }
        {
          action = "<C-w>l";
          key = "<leader>l";
          mode = "n";
        }
        {
          action = "<cmd>10winc\<<CR>";
          key = ".";
          mode = "n";
        }
        {
          action = "<cmd>10winc\><CR>";
          key = ",";
          mode = "n";
        }
      ];

      autoCmd = [
        {
          command = "setlocal nospell";
          event = [ "TermOpen" ];
        }
      ];
    };
  };
=======
=======
>>>>>>> upstream/main
    hostOptions,
    inputs,
    pkgs,
    ...
}:
{
    # Install Neovim system wide
    imports = [ ../neovim.nix ];

    hm = {
        imports = [
            inputs."nixvim-${hostOptions.channel}".homeManagerModules.nixvim

            # Plugins with large configurations are defined in their own modules
            ./plugins/telescope.nix
            ./plugins/nvimTree.nix
            ./plugins/undoTree.nix
            ./plugins/lsp.nix
        ];

        programs.nixvim = {
            enable = true;

            nixpkgs.useGlobalPackages = true;

            defaultEditor = true;
            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;

            luaLoader.enable = true;

            plugins = {
                nvim-autopairs.enable = true;
                lualine.enable = true;
                crates.enable = true;
                web-devicons.enable = true;
                treesitter = {
                    enable = true;
                    settings.highlight.enable = true;
                };
                markdown-preview.enable = true;
            };

            extraPlugins = with pkgs.vimPlugins; [
                {
                    plugin = term-edit-nvim;
                    config = ''lua require('term-edit').setup({prompt_end = '%$'})'';
                }
            ];

            opts = {
                autochdir = true;
                swapfile = false;
                backup = false;
                undofile = true;
                shortmess = "I";
                termguicolors = true;
                guicursor = "";
                cursorline = true;
                number = true;
                relativenumber = true;
                autoindent = true;
                cindent = true;
                expandtab = true;
                softtabstop = 4;
                shiftwidth = 4;
                incsearch = true;
                hlsearch = false;
                spell = true;
            };
            globals.mapleader = " ";

            keymaps = [
                {
                    action = "o<esc>O";
                    key = "<leader>o";
                    mode = "n";
                }
                {
                    action = "<C-u>zzzz";
                    key = "<C-u>";
                    mode = "n";
                }
                {
                    action = "<C-d>zzzz";
                    key = "<C-d>";
                    mode = "n";
                }
                {
                    action = "Gzzzz";
                    key = "G";
                    mode = "n";
                }
                {
                    action = "mzJ`z";
                    key = "J";
                    mode = "n";
                }

                {
                    action = "<C-R>";
                    key = "U";
                    mode = "n";
                }

                {
                    action = "<cmd>%y<CR>";
                    key = "ya";
                    mode = "n";
                }

                {
                    action = "\"+y";
                    key = "<leader>y";
                    mode = "";
                }
                {
                    action = "\"+y$";
                    key = "<leader>Y";
                    mode = "";
                }

                {
                    action = "<cmd>%y+<CR>";
                    key = "<leader>ya";
                    mode = "n";
                }

                {
                    action = "\"_dP";
                    key = "p";
                    mode = "x";
                }

                {
                    action = "\"+p";
                    key = "<leader>p";
                    mode = "";
                }
                {
                    action = "\"+P";
                    key = "<leader>P";
                    mode = "";
                }

                {
                    action = "<cmd>%d<CR>";
                    key = "da";
                    mode = "n";
                }

                {
                    action = "\"+d";
                    key = "<leader>d";
                    mode = "";
                }
                {
                    action = "\"+d$";
                    key = "<leader>D";
                    mode = "";
                }

                {
                    action = "<cmd>%d+<CR>";
                    key = "<leader>da";
                    mode = "n";
                }

                {
                    action = "<cmd>w<CR>";
                    key = "<leader>w";
                    mode = "n";
                }

                {
                    action = "<cmd>wq<CR>";
                    key = "<leader>q";
                    mode = "n";
                }

                {
                    action = "nzzzz";
                    key = "n";
                    mode = "n";
                }
                {
                    action = "Nzzzz";
                    key = "N";
                    mode = "n";
                }

                {
                    action = ":%s/";
                    key = "<leader>/";
                    mode = "n";
                }
                {
                    action = ":s/\\%V";
                    key = "<leader>/";
                    mode = "x";
                }

                {
                    action = "<cmd>bdelete!<CR>";
                    key = "<leader>bd";
                    mode = "n";
                }

                {
                    action = "<cmd>term<CR>";
                    key = "<leader>t";
                    mode = "n";
                }

                {
                    action = "<C-\\><C-n>";
                    key = "<Esc>";
                    mode = "t";
                }

                {
                    action = "<C-w>h";
                    key = "<leader>h";
                    mode = "n";
                }
                {
                    action = "<C-w>j";
                    key = "<leader>j";
                    mode = "n";
                }
                {
                    action = "<C-w>k";
                    key = "<leader>k";
                    mode = "n";
                }
                {
                    action = "<C-w>l";
                    key = "<leader>l";
                    mode = "n";
                }
                {
                    action = "<cmd>10winc\<<CR>";
                    key = ".";
                    mode = "n";
                }
                {
                    action = "<cmd>10winc\><CR>";
                    key = ",";
                    mode = "n";
                }
            ];

            autoCmd = [
                {
                    command = "setlocal nospell";
                    event = [ "TermOpen" ];
                }
            ];
        };
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
