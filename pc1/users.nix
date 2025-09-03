{ config, pkgs, lib, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.leecash = {
	isNormalUser = true;
	description = "LeeCash";
	extraGroups = [ "networkmanager" "wheel" "libvirtd" "openrazer" ];
	packages = with pkgs; [
		# user only stuff
	];
};

}
