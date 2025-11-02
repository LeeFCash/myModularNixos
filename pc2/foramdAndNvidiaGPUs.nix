{ config, lib, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
#	nvidia-settings
	glxinfo
	cudatoolkit
	vulkan-tools
	cudaPackages.cudatoolkit  # if you need CUDA
];
# `hardware.opengl.extraPackages' has been renamed to `hardware.graphics.extraPackages'.
# `hardware.opengl.driSupport32Bit' has been renamed to `hardware.graphics.enable32Bit'.
# `hardware.opengl.enable' defined in has been renamed to `hardware.graphics.enable'.
 # === Hardware OpenGL (Mesa for AMD, NVIDIA handles itself) ===
  hardware.graphics = {
    enable = true;
#    driSupport = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
boot.kernelModules = [ "amdgpu" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
hardware.nvidia = {
	modesetting.enable = true;
	package = config.boot.kernelPackages.nvidiaPackages.beta; # .stable or .beta for newer drivers
	open = true;# Enable open-source kernel modules
	nvidiaSettings = true;
};
services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" "nvidia" ];  # Order matters: AMD first = primary display
  };
}
