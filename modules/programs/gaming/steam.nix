{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    extraPackages = [ pkgs.gamescope ];
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
}
