{ config, pkgs, lib, ... }:

{
# 
hardware.bluetooth = {
	enable = true;
	settings = {
		General = {
			Enable = "Source,Sink,Media,Socket";
			ControllerMode = "dual"; # Supports both classic and BLE devices
			Experimental = true; # Enables experimental features, which may help
		};
	Policy = {
		AutoEnable = true; # Automatically enables Bluetooth on boot
	};
	};
};
hardware.firmware = with pkgs; [ linux-firmware ];
#
#environment.systemPackages = with pkgs; [
#  (bluez.overrideAttrs (old: {
#    version = "5.76";
#    src = pkgs.fetchFromGitHub {
#      owner = "bluez";
#      repo = "bluez";
#      rev = "5.76";
#      sha256 = "sha256-OisS9GIGyCVyiLy2fAXhoqY5yTWYlQlRuMehFq6/FPM="; # Replace if hash changes
#    };
#  }))
#];
}
