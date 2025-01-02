{ pkgs, ... }:
{
    hm.home = {
        packages = [
            pkgs.desk-exec
        ];
        shellAliases.run = "desk-exec -df";
    };
}
