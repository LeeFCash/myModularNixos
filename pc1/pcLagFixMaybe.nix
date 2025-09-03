# This is a NixOS configuration module, defining settings for your system.
# The arguments { config, pkgs, lib, ... } allow the module to access:
# - config: The entire system configuration.
# - pkgs: The Nix package set for installing software.
# - lib: Utility functions for writing Nix expressions.
# - ...: Allows additional arguments if needed (e.g., for custom options).
{ config, pkgs, lib, ... }:

{
  # This block defines the configuration options for your system.

  # Installs system-wide packages from the Nix package set.
  environment.systemPackages = with pkgs; [
    openrazer-daemon  # Installs the OpenRazer daemon, which provides support for Razer devices
                      # (e.g., your Razer Naga 2014 keyboard/mouse). It allows configuration
                      # of polling rates, lighting, and other device-specific settings to
                      # potentially reduce input lag.
    solaar            # Installs Solaar, a tool for managing Logitech devices, including the
                      # Logitech K360 keyboard's Unifying Receiver. It helps configure device
                      # settings and ensure proper communication, which may stabilize input.
  ];

  # Enables the OpenRazer service, which runs the daemon to manage Razer devices.
  # This ensures the Razer Naga 2014 is properly recognized and configured, potentially
  # addressing input lag by optimizing driver behavior.
  hardware.openrazer.enable = true;

  # Specifies kernel modules to load during boot.
  boot.kernelModules = [ "usbhid" ];
                      # Ensures the `usbhid` kernel module (USB Human Interface Device)
                      # is loaded. This module handles USB input devices like keyboards and
                      # mice, ensuring proper communication with your Razer and Logitech devices.

  # Configures additional options for kernel modules.
  boot.extraModprobeConfig = ''
    options usbhid kbpolldelay=5
  '';
  # This sets the `kbpolldelay` parameter for the `usbhid` module to 1 millisecond.
  # `kbpolldelay` controls the polling interval for USB keyboards. Setting it to a low
  # value (1ms) increases the polling frequency, which can reduce input lag by making
  # the system check for keyboard input more often. However, this may increase CPU usage
  # slightly, especially for high-polling-rate devices like gaming keyboards.

  # Blacklists specified kernel modules to prevent them from loading.
#  boot.blacklistedKernelModules = [ "evdev" ];
                      # Blacklists the `evdev` (generic event device) kernel module.
                      # `evdev` is an older input subsystem that can conflict with `libinput`
                      # (the modern input driver used by Wayland and X11). Blacklisting it
                      # ensures `libinput` handles your keyboards/mice without interference,
                      # which may resolve lag caused by driver conflicts.

  # Adds parameters to the kernel command line for boot.
  boot.kernelParams = [ "amdgpu.dc=1" "amdgpu.gpu_recovery=1" ];
                      # These parameters configure the `amdgpu` kernel module for your AMD RX 580 GPU:
                      # - `amdgpu.dc=1`: Enables the Display Core (DC) driver for AMD GPUs, which
                      #   handles display outputs. This can stabilize GPU performance, especially
                      #   under Wayland (used by Hyprland or Plasma), potentially reducing system-wide
                      #   lag that could affect input.
                      # - `amdgpu.gpu_recovery=1`: Enables GPU recovery mechanisms, allowing the
                      #   driver to reset the GPU if it hangs. This can prevent system slowdowns or
                      #   freezes that might indirectly cause input lag.
}
