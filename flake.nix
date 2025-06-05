{
  description = "MCP Server for YouTube";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.aarch64-linux.youtube-data-mcp-server = nixpkgs.legacyPackages.aarch64-linux.buildNpmPackage {
      pname = "youtube-data-mcp-server";
      version = "0.0.1";

      src = ./.;

      npmDepsHash = "sha256-sGs6ZHcO/7I6m5tytHr7gw8P8nd8bQ3H7sZ1yqW4YFY=";
    };

    packages.aarch64-linux.default = self.packages.aarch64-linux.youtube-data-mcp-server;

    devShells.aarch64-linux.default = nixpkgs.legacyPackages.aarch64-linux.mkShell {
      buildInputs = with nixpkgs.legacyPackages.aarch64-linux; [
        nodejs
        prefetch-npm-deps
      ];
    };

  };
}
