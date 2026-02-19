{ config, lib, pkgs, ... }:

{
nixpkgs.config.allowBroken = true;# for now 
#'glxinfo' has been renamed to/replaced by 'mesa-demos'
environment.systemPackages = with pkgs; [
#	nvidia-settings
#	glxinfo
	mesa-demos
	cudatoolkit# nixpkgs.config.allowBroken = true;
];
hardware.nvidia = {
	modesetting.enable = true;
	package = config.boot.kernelPackages.nvidiaPackages.beta; # .stable or .beta for newer drivers
	open = true;# Enable open-source kernel modules
	nvidiaSettings = true;  # Enable nvidia-settings tool
};
services.xserver.videoDrivers = [ "nvidia" ];
}
