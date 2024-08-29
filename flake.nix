{
	description = "Flake for deno development";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	};

	outputs =
	{ self
		, flake-utils
			, nixpkgs
	}:
	flake-utils.lib.eachDefaultSystem (
			system:
			let
			pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
			in
			{
			devShell = pkgs.mkShell {
			packages = with pkgs; [
# See https://github.com/NixOS/nixpkgs/issues/59209.
			bashInteractive
			deno
			];
			buildInputs = with pkgs; [

			];
			shellHook = ''
			export PATH=$PATH:~/.deno/bin
			'';

			};

			}
	);
}
