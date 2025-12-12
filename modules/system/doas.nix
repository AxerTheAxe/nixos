{ hostOptions, ... }:
{
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> upstream/main
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
<<<<<<< HEAD
>>>>>>> 4b39ab6c3a3ed33a9b49020184eab3e250bdb149
=======
>>>>>>> upstream/main
}
