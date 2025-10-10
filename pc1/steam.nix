{ config, pkgs, lib, ... }:

{
# steam Configuration
  programs.steam = {
  	enable = true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
	localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	gamescopeSession.enable = true; # Enables integration with Gamescope, a compositing manager developed by Valve (used in Steam Deck’s gaming mode).Gamescope provides features like resolution scaling, frame rate limiting, and a streamlined gaming environment. Enabling this creates a session script that launches Steam with Gamescope, mimicking the Steam Deck’s “Gaming Mode” experience, useful for big-picture mode or gaming-focused setups. 
  };
hardware.xone.enable = true; # support for the xbox controller USB dongle
environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Enable Wayland for Ozone apps # tells Steam (and other Ozone-based apps) to prefer Wayland, which is critical for compatibility with Gamescope in your Wayland-based NixOS setup. It’s a small but important setting to ensure your Gamescope session has the best chance of working. Let me know the results of the suggested checks or any specific errors!
# more for remotePlay in system the portal for the video part of it
# Vulkan for games (adjust for your GPU: amd/nvidia/intel)
#hardware.steam-hardware.enable = true;  # Pulls in Vulkan layers # should work without even in niri WM
}
