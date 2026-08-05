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
      url = "github:NixOS/nixpkgs/3a72af70557e100cc468ab3ab5717586e29370a0";
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

    winapps = {
      url = "github:winapps-org/winapps";
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
      winapps,
      nix-wpsoffice-cn,
      nixpkgs-mindustry,
      ...
    }:
    {
      homeConfigurations.yueyinqiu = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          flatpaks = flatpaks;
          nixvirt = NixVirt;
          nixpkgs-master = nixpkgs-master.legacyPackages."x86_64-linux";
          nur = nur.legacyPackages."x86_64-linux".repos;
          winapps = winapps.packages."x86_64-linux";
          nix-wpsoffice-cn = nix-wpsoffice-cn.packages."x86_64-linux";
          nixpkgs-mindustry = nixpkgs-mindustry;
        };
        modules = [
          ./src
        ];
      };
    };
}
