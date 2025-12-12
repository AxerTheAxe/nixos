{ ... }:
{
    services.xserver = {
        enable = true;
        displayManager.lightdm = {
            enable = true;
            greeters.slick.enable = true;
        };
    };
}
