{ config, pkgs, lib, ... }:

{
  # Enable graphics stack
  hardware.graphics = {
    enable = true;           # Enables OpenGL/Vulkan support
    enable32Bit = true;      # Needed for Steam/Proton & 32-bit apps
    extraPackages = with pkgs; [
      vaapiVdpau             # VAAPI -> VDPAU wrapper (video acceleration)
      libvdpau-va-gl         # VDPAU -> OpenGL bridge
      vulkan-tools           # For debugging Vulkan
      vulkan-loader
      vulkan-validation-layers
    ];
  };

  # Enable video decoding for browsers
  environment.variables = {
    LIBVA_DRIVER_NAME = "radeonsi";   # Force AMD VAAPI driver
    VDPAU_DRIVER = "radeonsi";
  };

  # AMD firmware – usually auto-installed, but keep this for certainty
  hardware.enableRedistributableFirmware = true;
  #services.xserver.videoDrivers = [ "amdgpu" ]; # maybe add
  }
