{ pkgs, ... }:
{
    environment.systemPackages = [
        (pkgs.prismlauncher.override {
            jdks = [
                pkgs.jdk
                pkgs.jdk8
                pkgs.graalvm-ce
            ];
        })
    ];
}
