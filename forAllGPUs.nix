{ config, pkgs, ... }:

{
  # Enable unfree packages (required for NVIDIA proprietary drivers)
  nixpkgs.config.allowUnfree = true;

  # Enable OpenGL and hardware rendering (Mesa covers AMD/Intel automatically)
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;  # For 32-bit apps (e.g., Steam)
  };

  # Load kernel modules for AMD/Intel (auto-detected; NVIDIA if enabled below)
  # Add any extras here if needed, e.g., boot.kernelModules = [ "amdgpu" "i915" ];
  boot.kernelModules = [ "amdgpu" "i915" ];  # AMD and Intel basics

  # Enable X11 (Wayland may need tweaks for NVIDIA)
  services.xserver.enable = true;

  # Enable drivers for ALL major GPUs
  # This list covers: Intel, AMD, NVIDIA (prop), Nouveau (open NVIDIA), VMWare, etc.
  # For multi-GPU, Xorg auto-assigns; tune BusIDs if conflicts.
  services.xserver.videoDrivers = [
    "intel"      # Intel iGPUs
    "amdgpu"     # Modern AMD (Radeon RX/Polaris+)
    "radeon"     # Legacy AMD (pre-Polaris)
    "nvidia"     # NVIDIA proprietary (RTX/GTX)
    "nouveau"    # Open-source NVIDIA fallback
    "vmware"     # VMWare/VirtualBox guests
    "modesetting" # Generic fallback for modern kernels
    # Add more if needed: "cirrus" (old hardware), "qxl" (QEMU)
  ];

  # NVIDIA-specific config (only loads if NVIDIA hardware detected)
  hardware.nvidia = {
    modesetting.enable = true;  # Required for most setups
    powerManagement.enable = false;  # Disable if overheating; experimental fine-grained for Turing+
    powerManagement.finegrained = false;
    open = false;  # Use proprietary (set true for open kernel module on RTX 20+)
    nvidiaSettings = true;  # Enable nvidia-settings tool
    # Example PRIME offload for hybrids (uncomment/adjust BusIDs from `lspci | grep VGA`)
    # prime = {
    #   offload.enable = true;
    #   intelBusId = "PCI:0:2:0";  # Your Intel BusID
    #   nvidiaBusId = "PCI:1:0:0"; # Your NVIDIA BusID
    # };
  };

  # Optional: Install tools for testing
  environment.systemPackages = with pkgs; [
    vulkan-tools  # vulkaninfo for Vulkan checks
    mesa-demos   # glxinfo for OpenGL checks
    nvidia-settings  # NVIDIA control (if applicable)
  ];
}
