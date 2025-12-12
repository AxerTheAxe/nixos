{ ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  environment = {
    shellAliases = {
      mkdir = "mkdir -p";
      cdtemp = "cd $(mktemp -d)";
      cp = "cp -r";
      grep = "grep --color=auto";
      nohup = "nohup > ~/.cache/nohup.out";
      poweroff = "systemctl poweroff";
      reboot = "systemctl reboot";
      reboot-firmware = "systemctl reboot --firmware-setup";
    };

    shellInit = ''
      mkcd() {
          mkdir -p "$@" && cd "$@"
      }
      hibernate() {
          # Output to /dev/null removes redundant newlines
          systemctl suspend > /dev/null 2>&1
          # Eat extra inputs
          sleep 3
      }
    '';
  };
=======
=======
>>>>>>> upstream/main
    environment = {
        shellAliases = {
            mkdir = "mkdir -p";
            cdtemp = "cd $(mktemp -d)";
            rm = "rm -rf";
            cp = "cp -r";
            grep = "grep --color=auto";
            nohup = "nohup > ~/.cache/nohup.out";
            poweroff = "systemctl poweroff";
            reboot = "systemctl reboot";
            reboot-firmware = "systemctl reboot --firmware-setup";
        };

        shellInit = ''
            mkcd() {
                mkdir -p "$@" && cd "$@"
            }
            hibernate() {
                # Output to /dev/null removes redundant newlines
                systemctl suspend > /dev/null 2>&1
                # Eat extra inputs
                sleep 3
            }
        '';
    };
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
