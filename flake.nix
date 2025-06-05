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

      npmDepsHash = "sha256-RTROQkoOpRUiBvB1zXittXB1HgtBN+GLTD0tx+ZkWaA=";
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
