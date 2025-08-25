{ config, pkgs, lib, ... }:

{
system.autoUpgrade = {
	enable = false;
	allowReboot = false;
	channel = "https://nixos.org/channels/nixos-unstable";
  };
# nix package managent 
  nix = {
	settings.auto-optimise-store = true;
	gc = {
		automatic = true;
		dates = "hourly";
		options = "--delete-older-than 1d";
	};

  };
}
