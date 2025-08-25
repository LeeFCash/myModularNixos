{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    davinci-resolve
    mesa.opencl  # Rusticl for OpenCL support
    clinfo       # To verify OpenCL
    ffmpeg       # For video conversion
    kitty        # Your terminal
  ];

  # Enable amdgpu driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable hardware acceleration and OpenCL
  hardware.graphics = {
	enable = true;
#	enable32Bit = true; # added after worked but for intel GPUs
	extraPackages = with pkgs; [
		rocmPackages.clr.icd # added after worked 
		mesa.opencl  # Rusticl OpenCL
		libva
		libvdpau-va-gl
		vulkan-loader
		vulkan-validation-layers # not sure but may do something with performance 
		amdvlk  # Optional: AMD's proprietary Vulkan driver
    ];
  };

  # Environment variables for DaVinci Resolve
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
    ROC_ENABLE_PRE_VEGA = "1";  # Enable OpenCL for Polaris (RX 580)
    QT_QPA_PLATFORM = "xcb";    # Ensure X11 compatibility (even on Wayland)
  };

  # Ensure kernel modules for amdgpu
  boot.kernelModules = [ "amdgpu" ];

}
