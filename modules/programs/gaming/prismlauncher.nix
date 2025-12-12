{ pkgs, ... }:
{
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
}
