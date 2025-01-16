{ pkgs, ... }:
{
    imports = [ ./alias.nix ];

    user.shell = pkgs.zsh;
    programs.zsh = {
        enable = true;
        enableGlobalCompInit = false;
    };

    hm.programs.zsh = {
        enable = true;
        dotDir = ".config/zsh";

        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;

        plugins =
            with pkgs;
            let
                pluginPackages =
                    packages:
                    map (pkg: {
                        name = pkg.pname;
                        src = pkg.src;
                    }) packages;
            in
            pluginPackages [
                zsh-autopair
                zsh-nix-shell
            ];

        initExtra = ''
            # Shift + enter
            bindkey "\E[13;2u" autosuggest-execute

            # Shift + control
            bindkey "\E[13;5u" autosuggest-accept

            PS1='%~ -> '
        '';
    };
}
