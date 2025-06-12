{
    config,
    pkgs,
    ...
}:
{
    imports = [ ./alias-nu.nix ];
    user.shell = pkgs.nushell;
    hm.programs = {
        nushell = {
            enable = true;

            shellAliases = config.hm.home.shellAliases;

            configFile.text = ''
                $env.config = {
                    show_banner: false
                    keybindings: [
                        {
                            modifier: shift
                            keycode: enter
                            event: [ 
                                { send: historyhintcomplete } 
                                { send: enter }
                            ]
                            mode: emacs
                        }
                        {
                            modifier: control
                            keycode: enter
                            event: [ { send: historyhintcomplete } ]
                            mode: emacs
                        }
                        {
                            modifier: alt
                            keycode: enter
                            event: [ { send: historyhintwordcomplete } ]
                            mode: emacs
                        }
                    ]
                }
            '';
        };

        carapace.enable = true;
    };
}
