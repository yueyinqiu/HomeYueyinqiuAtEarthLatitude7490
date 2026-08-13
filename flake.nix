{
  inputs = {
    os = {
      url = "github:yueyinqiu/NixosEarthLatitude7490";
    };
    nixpkgs = {
      follows = "os/nixpkgs";
    };
    NixVirt = {
      follows = "os/NixVirt";
    };

    nixpkgs-mindustry = {
      url = "github:NixOS/nixpkgs/241313f4e8e508cb9b13278c2b0fa25b9ca27163";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-wpsoffice-cn = {
      url = "github:Beriholic/nix-wpsoffice-cn";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      flatpaks,
      NixVirt,
      nur,
      nix-wpsoffice-cn,
      nixpkgs-mindustry,
      ...
    }:
    {
      homeConfigurations."yueyinqiu@earth-latitude-7490" =
        let
          system = "x86_64-linux";
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
            flatpaks = flatpaks;
            nixvirt = NixVirt;
            nixpkgs-mindustry = nixpkgs-mindustry.legacyPackages.${system};
            nur = nur.legacyPackages.${system}.repos;
            nix-wpsoffice-cn = nix-wpsoffice-cn.packages.${system};
          };
          modules = [
            ./src
          ];
        };

      devShells = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              (pkgs.writeShellScriptBin "dev-switch-local" ''
                ssh localhost -t "cd '$PWD' && all_proxy=socks5h://127.0.0.1:26290 home-manager switch --flake ."
              '')
            ];
          };
        }
      );
    };
}
