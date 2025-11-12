{ config, lib, pkgs, ... }:

{
fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  nerd-fonts.noto
  ];
environment.systemPackages = with pkgs; [
	niri
	alacritty
	fuzzel
	waybar
	xwayland-satellite#Xwayland outside your Wayland compositor
	mako#notification daemon
	swaybg#A wallpaper utility for Wayland compositors, that is compatible with any Wayland compositor which implements the following Wayland protocols: wlr-layer-shell, xdg-output, and xdg-shell.
	wlrctl
  ];

programs.niri.enable = true;
programs.waybar.enable = false;# seems to not work# non working warbar and 2 of them without changing anything in niri config
# Essential for Wayland apps (Electron/Chromium)
environment.sessionVariables.NIXOS_OZONE_WL = "1";
# For X11 apps (Steam/Discord fallback)
programs.xwayland.enable = true;  # Usually auto-enabled with Niri
# Notification daemon (required for Discord) # I think I already have it work without but just in case keep for later 
#services.mako.enable = true;  # Or dunst if preferred
# maybe do if does not work
#hardware.opengl = {
#  enable = true;
#  driSupport = true;
#  driSupport32Bit = true;  # Critical for Steam
#};
}
