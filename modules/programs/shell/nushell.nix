{
    config,
    pkgs,
    ...
}:
{
    user.shell = pkgs.nushell;
    hm.programs = {
        nushell = {
            enable = true;

            shellAliases = config.hm.home.shellAliases;
            configFile.text = ''
                def disown [...command: string] {
                    sh -c '"$@" </dev/null >/dev/null 2>/dev/null & disown' $command.0 ...$command
                }

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
