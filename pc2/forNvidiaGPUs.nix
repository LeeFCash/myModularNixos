{ config, lib, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
#	nvidia-settings
	glxinfo
	cudatoolkit
];
hardware.nvidia = {
	modesetting.enable = true;
	package = config.boot.kernelPackages.nvidiaPackages.beta; # .stable or .beta for newer drivers
	open = true;# Enable open-source kernel modules
	nvidiaSettings = true;
};
services.xserver.videoDrivers = [ "nvidia" ];
}
