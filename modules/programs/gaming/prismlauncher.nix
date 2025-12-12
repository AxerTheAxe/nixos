{ pkgs, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
  environment.systemPackages = [
    (pkgs.prismlauncher.override {
      jdks = with pkgs; [
        jdk25
        jdk
        jdk17
        jdk8
      ];
    })
  ];
=======
=======
>>>>>>> upstream/main
    environment.systemPackages = [
        (pkgs.prismlauncher.override {
            jdks = with pkgs; [
                jdk
                jdk8
                jdk17
                graalvm-ce
            ];
        })
    ];
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
