{ ... }:
{
    hm.home.shellAliases = {
        mkdir = "mkdir -p";
        rm = "rm -r";
        cp = "cp -r";
        grep = "grep --color=auto";
        nohup = "nohup > ~/.cache/nohup.out";
        poweroff = "systemctl poweroff";
        reboot = "systemctl reboot";
        reboot-firmware = "systemctl reboot --firmware-setup";
        hibernate = "systemctl suspend";
    };
}
