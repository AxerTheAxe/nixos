<<<<<<< HEAD
<<<<<<< HEAD
{ pkgs, hostOptions, ... }:
=======
{ pkgs, ... }:
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
{ pkgs, ... }:
>>>>>>> upstream/main
{
    imports = [ ./alias.nix ];

    user.shell = pkgs.zsh;
    programs.zsh = {
        enable = true;
        enableGlobalCompInit = false;
    };

    hm.programs.zsh = {
        enable = true;
<<<<<<< HEAD
<<<<<<< HEAD
        dotDir = "/home/${hostOptions.user.userName}/.config/zsh";
=======
        dotDir = ".config/zsh";
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
        dotDir = ".config/zsh";
>>>>>>> upstream/main

        autosuggestion.enable = true;
        autocd = true;
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

        initContent = ''
            # Shift + enter
            bindkey "\E[13;2u" autosuggest-execute

            # Shift + control
            bindkey "\E[13;5u" autosuggest-accept

            PS1='%2~ -> '
        '';
    };
}
