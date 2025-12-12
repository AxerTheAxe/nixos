{ hostOptions, ... }:
{
  security.doas = {
    enable = true;
    extraRules = [
      {
        users = [ hostOptions.user.userName ];
        keepEnv = true;
        persist = true;
      }
    ];
  };
}
