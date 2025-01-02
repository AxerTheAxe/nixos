{ hostOptions, ... }:
{
    # Use 24-hour clock
    # Uses GB for clock only
    i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";

    time.timeZone = hostOptions.system.timeZone;
    services.timesyncd.enable = true;
}
