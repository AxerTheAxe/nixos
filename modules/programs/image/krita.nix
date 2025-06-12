{ pkgs, ... }:
{
    hm.home = {
        packages = [ pkgs.krita ];
        sessionVariables.KRITA_NO_STYLE_OVERRIDE = "1";
    };
}
