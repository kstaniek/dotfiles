{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: let
    makeHomeManagerConfiguration = {
      system,
      username,
      homeDirectory ? "/home/${username}",
    }: let
      pkgs = nixpkgs.legacyPackages.${system};
    in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          {
            home = {
              inherit homeDirectory username;
              stateVersion = "23.11";
            };
          }
        ];
      };
  in {
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    homeConfigurations.klstanie = makeHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "klstanie";
    };
    homeConfigurations.klstanie-ci = makeHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "runner";
      homeDirectory = "/home/runner";
    };
  };
}