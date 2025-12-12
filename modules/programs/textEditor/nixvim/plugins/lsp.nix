{ pkgs, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  programs.nixvim = {
    extraPlugins = [
      {
        plugin = pkgs.vimPlugins.lazydev-nvim;
        config = ''lua require("lazydev").setup()'';
      }

      {
        plugin = pkgs.vimPlugins.roslyn-nvim;
        config = ''lua require("lazydev").setup()'';
      }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
            autostart = true;
          };
          clangd = {
            enable = true;
            autostart = true;
            # Per-project installation is warranted
            package = null;
          };
          rust_analyzer = {
            enable = true;
            autostart = true;
            installRustc = true;
            installCargo = true;
            installRustfmt = true;
          };
          omnisharp = {
            enable = false;
            autostart = true;
            settings = {
              enableEditorConfigSupport = true;
              enableImportCompletion = true;
              enableRoslynAnalyzers = true;
              analyzeOpenDocumentsOnly = false;
              organizeImportsOnFormat = true;
            };
          };
          jdtls = {
            enable = true;
            autostart = true;
          };
          bashls = {
            enable = true;
            autostart = true;
          };
          lua_ls = {
            enable = true;
            autostart = true;
          };
          taplo = {
            enable = true;
            autostart = true;
          };
          pylsp = {
            enable = true;
            autostart = true;
          };
        };
        keymaps = {
          silent = true;
          diagnostic = {
            "<C-p>" = "goto_prev";
            "<C-n>" = "goto_next";
            "<leader>cdi" = "open_float";
          };
          lspBuf = {
            "<leader>ch" = "hover";
            "<leader>cdf" = "definition";
            "<leader>cdc" = "declaration";
            "<leader>cim" = "implementation";
            "<leader>ctd" = "type_definition";
            "<leader>csh" = "signature_help";
            "<leader>cr" = "rename";
            "<leader>cf" = "format";
            "<leader>ca" = "code_action";
          };
        };
      };

      otter.enable = true;

      # Enables format on write
      lsp-format.enable = true;

      none-ls = {
        enable = true;
        sources.formatting = {
          mdformat.enable = true;
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt-rfc-style;
          };
        };
      };

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];

          mapping = {
            "<C-j>" = "cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select})";
            "<C-k>" = "cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})";

            "<S-CR>" = "cmp.mapping.confirm({select = true})";

            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";
          };
        };
      };
    };
  };
=======
=======
>>>>>>> upstream/main
    programs.nixvim = {
        extraPlugins = [
            {
                plugin = pkgs.vimPlugins.lazydev-nvim;
                config = ''lua require("lazydev").setup()'';
            }
        ];

        plugins = {
            lsp = {
                enable = true;
                servers = {
                    nixd = {
                        enable = true;
                        autostart = true;
                    };
                    clangd = {
                        enable = true;
                        autostart = true;
                        # Per-project installation is warranted
                        package = null;
                    };
                    rust_analyzer = {
                        enable = true;
                        autostart = true;
                        installRustc = true;
                        installCargo = true;
                        installRustfmt = true;
                    };
                    omnisharp = {
                        enable = true;
                        autostart = true;
                        settings = {
                            enableEditorConfigSupport = true;
                            enableImportCompletion = true;
                            enableRoslynAnalyzers = true;
                            analyzeOpenDocumentsOnly = false;
                            organizeImportsOnFormat = true;
                            test = false;
                        };
                    };
                    bashls = {
                        enable = true;
                        autostart = true;
                    };
                    lua_ls = {
                        enable = true;
                        autostart = true;
                    };
                    taplo = {
                        enable = true;
                        autostart = true;
                    };
                    pylsp = {
                        enable = true;
                        autostart = true;
                    };
                };
                keymaps = {
                    silent = true;
                    diagnostic = {
                        "<C-p>" = "goto_prev";
                        "<C-n>" = "goto_next";
                        "<leader>cdi" = "open_float";
                    };
                    lspBuf = {
                        "<leader>ch" = "hover";
                        "<leader>cdf" = "definition";
                        "<leader>cdc" = "declaration";
                        "<leader>cim" = "implementation";
                        "<leader>ctd" = "type_definition";
                        "<leader>csh" = "signature_help";
                        "<leader>cr" = "rename";
                        "<leader>cf" = "format";
                        "<leader>ca" = "code_action";
                    };
                };
            };

            otter.enable = true;

            # Enables format on write
            lsp-format.enable = true;

            none-ls = {
                enable = true;
                sources.formatting = {
                    nixfmt = with pkgs; {
                        enable = true;
                        # Nixfmt patch with four space indentation
                        package = nixfmt-classic.overrideAttrs (oldAttrs: {
                            src = fetchFromGitHub {
                                owner = "axertheaxe";
                                repo = "nixfmt";
                                rev = "aef65a57dff10746e6dbb47d8ae34f4a265bbad5";
                                sha256 = "sha256-m2hqRgwOSyA/npB/iBIcaPSueNfnrqR7FhFVvjAmmxs=";
                            };
                            buildInputs = oldAttrs.buildInputs or [ ] ++ [
                                haskellPackages.file-embed
                                haskellPackages.pretty-simple
                            ];
                        });
                    };
                };
            };

            cmp = {
                enable = true;
                settings = {
                    sources = [
                        { name = "nvim_lsp"; }
                        { name = "path"; }
                        { name = "buffer"; }
                    ];

                    mapping = {
                        "<C-j>" = "cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select})";
                        "<C-k>" = "cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})";

                        "<S-CR>" = "cmp.mapping.confirm({select = true})";

                        "<C-u>" = "cmp.mapping.scroll_docs(-4)";
                        "<C-d>" = "cmp.mapping.scroll_docs(4)";
                    };
                };
            };
        };
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
