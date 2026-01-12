{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
#nix-shell "path to shell file"
	buildInputs = [
		pkgs.git
		pkgs.tmux
		pkgs.vim
		pkgs.unzip
		pkgs.zip
		pkgs.jdk
		pkgs.killall
		pkgs.appimage-run
		pkgs.tree
		pkgs.neofetch
	];
	shellHook = ''
		echo "This is a script that starts when you use this shell."
	'';
}
