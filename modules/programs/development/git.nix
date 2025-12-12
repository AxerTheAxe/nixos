{
  hostOptions,
  config,
  lib,
  ...
}:
{
  options.git = with lib; {
    enable = mkEnableOption "Enable Git configuration.";
    name = mkOption {
      type = types.str;
      default = hostOptions.user.name or "Jane Doe";
      description = "Full name of the Git user.";
    };
    email = mkOption {
      type = types.str;
      default = hostOptions.user.email or "janedoe@foo.net";
      description = "Email of the git user.";
    };

    ssh = {
      enable = mkEnableOption "Enable commit signing with SSH.";
      publicKey = mkOption {
        type = types.str;
        default = "/path/to/public/key";
        description = "Path to file containing a public SSH key.";
      };
      privateKey = mkOption {
        type = types.str;
        default = "/path/to/private/key";
        description = "Path to file containing a private SSH key.";
      };
    };
  };

  config =
    let
      git = config.git;
      ssh = config.git.ssh;
    in
    with lib;
    mkMerge [
      (lib.mkIf git.enable {
        hm.programs.git = {
          enable = true;
          settings = {
            user.name = git.name;
            user.email = git.email;
            init.defaultBranch = "main";
          };
          signing.signByDefault = true;
        };
      })

      (lib.mkIf ssh.enable {
        hm = {
          programs = {
            git = {
              signing.key = ssh.publicKey;
              signing.format = "ssh";
              settings.extraConfig.gpg.format = "ssh";
            };
            ssh = {
              enable = true;
              enableDefaultConfig = false;

              matchBlocks = {
                "*" = {
                  addKeysToAgent = "yes";
                  identityFile = [ ssh.privateKey ];
                };
              };

              extraConfig = ''
                Host *
                  IdentitiesOnly yes
              '';
            };
          };
          services.ssh-agent.enable = true;
        };
        # programs.ssh.startAgent = true;
      })
    ];
}
