{ ... }:
{
    environment = {
        shellAliases = {
            cdtemp = "cd (mktemp -d)";
            rm = "rm -rf";
            cp = "cp -r";
            grep = "grep --color=auto";
            nohup = "nohup | save ~/.cache/nohup.out";
            poweroff = "systemctl poweroff";
            reboot = "systemctl reboot";
            reboot-firmware = "systemctl reboot --firmware-setup";
            hibernate = "systemctl suspend";
        };

        shellInit = ''
            def mkcd [dir] {
                mkdir dir
                cd dir
            }
        '';
    };
}
