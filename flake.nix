{
  description = "Flakes are to Nix what automatic slicers are to bread.";

  outputs =
    inputs@{ ... }:
    let
      hosts = import ./hosts/hosts.nix;
      createHost =
        hostName: hostOptions:
        inputs."nixos-${hostOptions.channel}".lib.nixosSystem {
          modules = [ hostOptions.module ];
          specialArgs = { inherit inputs hostOptions; };
        };
    in
    {
      nixosConfigurations = builtins.mapAttrs (
        hostName: hostOptions: createHost hostName hostOptions
      ) hosts;
    };

  inputs = {
    nixos-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixos-stable";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    nixvim-stable = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixos-stable";
    };
    nixvim-unstable = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    stylix-stable = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixos-stable";
    };
    stylix-unstable = {
      url = "github:danth/stylix/master";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    catppuccin.url = "github:catppuccin/nix";
  };
}
