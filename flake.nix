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
    nur = {
      follows = "os/nur";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
    };

    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };

    nix-wpsoffice-cn = {
      url = "github:Beriholic/nix-wpsoffice-cn";
    };

    nvf = {
      url = "github:notashelf/nvf";
    };

    mindustry-bin = {
      url = "github:yueyinqiu/MindustryBinNix";
    };
    
    nix-airgap = {
      url = "github:bitbloxhub/nix-airgap";
    };

    sub-nix = {
      url = "github:yueyinqiu/SubNix";
    };
  };

  outputs = inputs: {
    homeConfigurations."yueyinqiu@earth-latitude7490" =
      let
        system = "x86_64-linux";
      in
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          flatpaks = inputs.flatpaks;
          nixvirt = inputs.NixVirt;
          nur = inputs.nur.legacyPackages.${system}.repos;
          nix-wpsoffice-cn = inputs.nix-wpsoffice-cn.packages.${system};
          nvf = inputs.nvf;
          mindustry-bin = inputs.mindustry-bin.packages.${system};
          nix-airgap = inputs.nix-airgap.packages.${system};
          sub-nix = inputs.sub-nix;
        };
        modules = [
          ./src
        ];
      };

    devShells = inputs.nixpkgs.lib.genAttrs inputs.nixpkgs.lib.systems.flakeExposed (system: {
      default = import ./dev {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      };
    });
  };
}
