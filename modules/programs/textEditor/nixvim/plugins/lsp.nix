{ pkgs, ... }:
{
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

    home.file.".clang-format" = {
        enable = true;
        text = ''
            Language: Cpp

            BasedOnStyle: LLVM

            AccessModifierOffset: -4

            AlignAfterOpenBracket: DontAlign
            AlignArrayOfStructures: None
            AlignConsecutiveAssignments: false
            AlignConsecutiveBitFields: false
            AlignConsecutiveDeclarations: false 
            AlignConsecutiveMacros: false
            AlignConsecutiveShortCaseStatements:
              Enabled: false
            AlignEscapedNewlines: DontAlign
            AlignOperands: DontAlign
            AlignTrailingComments: Never 

            AllowAllArgumentsOnNextLine: true
            AllowAllParametersOfDeclarationOnNextLine: true
            AllowBreakBeforeNoexceptSpecifier: Never
            AllowShortBlocksOnASingleLine: Empty
            AllowShortCaseLabelsOnASingleLine: false
            AllowShortCompoundRequirementOnASingleLine: true
            AllowShortEnumsOnASingleLine: false
            AllowShortFunctionsOnASingleLine: Empty
            AllowShortIfStatementsOnASingleLine: Never
            AllowShortLambdasOnASingleLine: Empty
            AllowShortLoopsOnASingleLine: false

            AlwaysBreakAfterReturnType: None
            AlwaysBreakBeforeMultilineStrings: false
            AlwaysBreakTemplateDeclarations: Yes

            BinPackArguments: true
            BinPackParameters: true

            BitFieldColonSpacing: Both

            BreakAdjacentStringLiterals: true
            BreakAfterAttributes: Always
            BreakBeforeBinaryOperators: None
            BreakBeforeBraces: Attach
            BreakBeforeConceptDeclarations: Always
            BreakBeforeInlineASMColon: Never
            BreakBeforeTernaryOperators: false
            BreakConstructorInitializers: AfterColon
            BreakInheritanceList: AfterColon
            BreakStringLiterals: false

            ColumnLimit: 100

            CompactNamespaces: true

            ContinuationIndentWidth: 4

            Cpp11BracedListStyle: true

            DerivePointerAlignment: false

            EmptyLineAfterAccessModifier: Never
            EmptyLineBeforeAccessModifier: LogicalBlock

            ExperimentalAutoDetectBinPacking: false

            FixNamespaceComments: false

            IncludeBlocks: Regroup

            IndentAccessModifiers: false
            IndentCaseBlocks: false
            IndentCaseLabels: false
            IndentExternBlock: Indent
            IndentGotoLabels: true
            IndentPPDirectives: None
            IndentRequiresClause: false
            IndentWidth: 4
            IndentWrappedFunctionNames: true

            InsertBraces: true
            InsertNewlineAtEOF: false

            KeepEmptyLinesAtEOF: false
            KeepEmptyLinesAtTheStartOfBlocks: false

            LambdaBodyIndentation: OuterScope

            LineEnding: LF

            MaxEmptyLinesToKeep: 1

            NamespaceIndentation: All

            PackConstructorInitializers: NextLine

            PointerAlignment: Left
            ReferenceAlignment: Pointer
            QualifierAlignment: Custom

            QualifierOrder: ["volatile", "static", "inline", "constexpr", "const", "restrict", "friend", "type"]

            ReflowComments: true

            RemoveBracesLLVM: false
            RemoveParentheses: MultipleParentheses
            RemoveSemicolon: true

            RequiresClausePosition: OwnLine
            RequiresExpressionIndentation: OuterScope

            SeparateDefinitionBlocks: Always

            SortIncludes: CaseInsensitive
            SortUsingDeclarations: Lexicographic

            SpaceAfterCStyleCast: false
            SpaceAfterLogicalNot: false
            SpaceAfterTemplateKeyword: false
            SpaceAroundPointerQualifiers: Default
            SpaceBeforeAssignmentOperators: true
            SpaceBeforeCaseColon: true
            SpaceBeforeCpp11BracedList: false
            SpaceBeforeCtorInitializerColon: true
            SpaceBeforeInheritanceColon: true
            SpaceBeforeParens: ControlStatements
            SpaceBeforeRangeBasedForLoopColon: true
            SpaceBeforeSquareBrackets: false
            SpaceInEmptyBlock: false

            SpacesBeforeTrailingComments: 1
            SpacesInAngles: false
            SpacesInContainerLiterals: false
            SpacesInLineCommentPrefix:
              Minimum: 1
              Maximum: 1
            SpacesInParens: Never
            SpacesInSquareBrackets: false

            Standard: Latest

            UseTab: Never
            TabWidth: 4
        '';
    };
}
