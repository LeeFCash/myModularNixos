{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
	buildInputs = [
		pkgs.tmux
		pkgs.vim
		pkgs.jdk
	];
	shellHook = ''
		echo "This is a script that starts when you use this shell."
		cd /tmp
		mkdir testingJava
		cd testingJava
		touch testing.java
		ls
	'';
}
