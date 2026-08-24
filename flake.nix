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
    };

    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    nix-wpsoffice-cn = {
      url = "github:Beriholic/nix-wpsoffice-cn";
    };

    nvf = {
      url = "github:notashelf/nvf";
    };
  };

  outputs = inputs:
    {
      homeConfigurations."yueyinqiu@earth-latitude7490" =
        let
          system = "x86_64-linux";
        in
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
            flatpaks = inputs.flatpaks;
            nixvirt = inputs.NixVirt;
            nixpkgs-mindustry = inputs.nixpkgs-mindustry.legacyPackages.${system};
            nur = inputs.nur.legacyPackages.${system}.repos;
            nix-wpsoffice-cn = inputs.nix-wpsoffice-cn.packages.${system};
            nvf = inputs.nvf;
          };
          modules = [
            ./src
          ];
        };

      devShells = inputs.nixpkgs.lib.genAttrs inputs.nixpkgs.lib.systems.flakeExposed (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
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
