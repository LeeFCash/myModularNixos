{ config, lib, pkgs, ... }:

{
fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  nerd-fonts.noto
  ];
environment.systemPackages = with pkgs; [
	niri
#	wayland# testing 
#	wlroots# testing 
	alacritty
	fuzzel
	waybar
	xwayland-satellite#Xwayland outside your Wayland compositor
#	mako#notification daemon
#	swaybg#A wallpaper utility for Wayland compositors, that is compatible with any Wayland compositor which implements the following Wayland protocols: wlr-layer-shell, xdg-output, and xdg-shell.
#	wlrctl
	xdg-desktop-portal-gnome#recommended#Backend implementation for xdg-desktop-portal for the GNOME desktop environment
	nirius#Utility commands for the niri wayland compositor
	niriswitcher#Application switcher for niri
	sunsetr#Automatic blue light filter for Hyprland, Niri, and everything Wayland
#	stardust-xr-kiara#360-degree app shell / DE for Stardust XR using Niri
	iio-niri#Listen to iio-sensor-proxy and updates Niri output orientation depending on the accelerometer orientation
#	kdePackages.polkit-kde-agent-1#Daemon providing a Polkit authentication UI for Plasma
#	xdg-desktop-portal-gnome#Backend implementation for xdg-desktop-portal for the GNOME desktop environment
#	xdg-desktop-portal-gtk#Desktop integration portals for sandboxed apps
#	xdg-desktop-portal-wlr#steam needs this #xdg-desktop-portal backend for wlroots
#	gnome-keyring#do not like but might be needed #Collection of components in GNOME that store secrets, passwords, keys, certificates and make them available to applications
#	seatd#Minimal seat management daemon, and a universal seat management library
	gtk3# Required for GTK file chooser #GTK is a highly usable, feature rich toolkit for creating graphical user interfaces which boasts cross platform compatibility and an easy to use API. GTK it is written in C, but has bindings to many other popular programming languages such as C++, Python and C# among others. GTK is licensed under the GNU LGPL 2.1 allowing development of both free and proprietary software with GTK without any license fees or royalties.
  ];
#
programs.niri = {
	enable = true;
#	xwayland.enable = true;
};
# works but kinda don't (if their is no lock screen) but new way of installing and making niri work down.
#systemd.user.services.niri = {
#	description = "start Niri wayland compositor";
#	after = [ "graphical.target" ];
#	serviceConfig.ExecStart = "${pkgs.niri}/bin/niri";
#	wantedBy = [ "default.target" ];
#};
#security.chromiumSuidSandbox.enable = true;
#environment.sessionVariables = {
#	NIXOS_OZONE_WL = "1";           # Electron/Chromium
#	NIRI_WAYLAND = "1";
#	_JAVA_AWT_WM_NONREPARENTING = "1";  # Java Swing fix
#	QT_QPA_PLATFORM = "wayland";
#	MOZ_ENABLE_WAYLAND = "1";
#	XDG_SESSION_TYPE = "wayland";
#};
environment.sessionVariables = {
	_JAVA_AWT_WM_NONREPARENTING = "1";  # Java Swing fix
};
# REQUIRED: Correct xdg-desktop-portal setup for Niri (wlroots)
# For X11 apps (Steam/Discord fallback)
programs.xwayland.enable = true;  # Usually auto-enabled with Niri
# REQUIRED: Correct xdg-desktop-portal setup for Niri (wlroots)
#xdg.portal = {
#    enable = true;

    # Enable wlroots backend (this is the one Niri needs)
#    wlr.enable = true;

    # Explicitly set portal backends
#    extraPortals = [
#      pkgs.xdg-desktop-portal-wlr
#    ];
#  };
}
