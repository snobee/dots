{
  description = "dot dot dot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    roc.url = "github:roc-lang/roc/main";

    ki.url = "github:ki-editor/ki-editor/master";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-hardware,
      roc,
      ki,
      stylix,
      ...
    }:
    let

      overlay = final: prev: {
        roc = roc.packages.${prev.system}.full;
        ki = ki.packages.${prev.system}.default;
      };

      pkgsForSystem =
        system:
        import nixpkgs {
          inherit system;
          overlays = [ overlay ];
          config.allowUnfree = true;
        };

      mkHomeConfiguration =
        { system, modules }:
        home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit system; };
          pkgs = pkgsForSystem system;
          modules = [
            stylix.homeManagerModules.stylix
            ./home
          ]
          ++ modules;
        };

    in
    {
      homeConfigurations."sammi@surface" = mkHomeConfiguration {
        system = "x86_64-linux";
        modules = [
          ./home/dev.nix
          ./home/hyprland.nix
        ];
      };

      nixosConfigurations.surface = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit nixos-hardware; };
        system = "x86_64-linux";
        modules = [ ./hosts/surface.nix ];
      };
    };
}
