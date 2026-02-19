{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
	buildInputs = [
		pkgs.tmux
		pkgs.jdk
	];
	shellHook = ''
		echo "This is a script that starts when you use this shell."
		ls
	'';
}
