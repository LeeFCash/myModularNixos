{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    davinci-resolve-studio
    mesa.opencl  # Rusticl for OpenCL support
    clinfo       # To verify OpenCL
    ffmpeg       # For video conversion
    kitty        # Your terminal
  ];

# for down but up already work but adding this in case of problem past loggin to (in theory should fix it if the minimum code up does not work past login) that I am unable to test

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Required for some 32-bit dependencies in Resolve
    extraPackages = with pkgs; [
      mesa
      mesa.opencl # Enables Rusticl for OpenCL
      rocmPackages.clr # ROCm for additional AMD GPU support
      libva
      libvdpau-va-gl
      vulkan-loader
      vulkan-validation-layers
      amdvlk # Optional: AMD's proprietary Vulkan driver
    ];
  };
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
    ROC_ENABLE_PRE_VEGA = "1"; # Needed for Polaris GPUs like RX 580
  };

}
