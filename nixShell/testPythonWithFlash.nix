{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
	buildInputs = [
		pkgs.tmux
		pkgs.vim
		pkgs.python312
		pkgs.python312Packages.flask
	];
	shellHook = ''
		echo "This is a script that starts when you use this shell."
	'';
}
