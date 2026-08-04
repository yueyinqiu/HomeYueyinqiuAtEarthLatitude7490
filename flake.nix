{
  inputs = {    
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-master = {
      url = "github:NixOS/nixpkgs/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };

    NixVirt = {
      url = "github:AshleyYakeley/NixVirt/v0.6.0";
      inputs.nixpkgs.follows = "nixpkgs";
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
    
    yueyinqiu-nur-packages = {
      url = "github:yueyinqiu/MyNurPackages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-master,
      home-manager,
      flatpaks,
      NixVirt,
      nur,
      winapps,
      nix-wpsoffice-cn,
      yueyinqiu-nur-packages,
      ...
    }:
    {
      homeConfigurations.yueyinqiu = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          flatpaks = flatpaks;
          nixvirt = NixVirt;
          nixpkgs-master = nixpkgs-master.legacyPackages."x86_64-linux";
          nur = nur.legacyPackages."x86_64-linux";
          winapps = winapps.packages."x86_64-linux";
          nix-wpsoffice-cn = nix-wpsoffice-cn.packages."x86_64-linux";
          yueyinqiu-nur-packages = yueyinqiu-nur-packages.legacyPackages."x86_64-linux";
        };
        modules = [
          ./src
        ];
      };
    };
}
