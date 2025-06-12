{ hostOptions, ... }:
{
    i18n = {
        defaultLocale = "en_DK.UTF-8";
        extraLocaleSettings = {
            LC_NUMERIC = "en_US.UTF-8";
            LC_MONETARY = "en_US.UTF-8";
            LC_COLLATE = "en_US.UTF-8";
        };
    };

    time.timeZone = hostOptions.system.timeZone;

    # Better than sytemd-timesyncd
    services.chrony.enable = true;
}
