{ pkgs, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  hm.home.packages = [
    pkgs.wiremix
  ];
=======
=======
>>>>>>> upstream/main
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;
        pulse.enable = true;
        jack.enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
    };

    hm.home.packages = [ pkgs.pavucontrol ];
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
