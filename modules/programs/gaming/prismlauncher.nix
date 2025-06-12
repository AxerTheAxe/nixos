{ pkgs, ... }:
{
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
}
