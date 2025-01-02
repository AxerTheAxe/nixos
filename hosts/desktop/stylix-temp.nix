{
    hostOptions,
    inputs,
    pkgs,
    ...
}:
{
    imports = [ inputs."stylix-${hostOptions.channel}".nixosModules.stylix ];

    hm = {
        imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

        catppuccin = {
            enable = true;

            flavor = "mocha";
            accent = "pink";

            gtk.icon.enable = true;
            # kvantum.enable = true;
        };

        qt = {
            enable = true;
            platformTheme.name = "kvantum";
            style.name = "kvantum";
        };

        stylix.targets.kitty.enable = false;

        xdg.configFile."WebCord/Themes/mocha.theme".text = ''
            @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-pink.theme.css");
        '';
    };

    stylix = {
        enable = true;
        image = ../../wallpapers/hollow-knight-1.png;

        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        override.base0D = "#f5c2e7";

        fonts = with pkgs; {
            monospace = {
                package = nerd-fonts.fira-code;
                name = "FiraCode Nerd Font Mono";
            };

            serif = {
                package = fira-sans;
                name = "Fira Sans";
            };

            sansSerif = {
                package = fira-sans;
                name = "Fira Sans";
            };
        };

        cursor = {
            package = pkgs.catppuccin-cursors.mochaPink;
            name = "catppuccin-mocha-pink-cursors";
            size = 16;
        };
    };
}
