{ hostOptions, ... }:
{
    security.sudo = {
        enable = true;
        extraRules = [
            {
                users = [ hostOptions.user.userName ];
                commands = [ { command = "ALL"; } ];
            }
        ];
    };
}
