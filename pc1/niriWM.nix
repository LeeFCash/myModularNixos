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
#	xdg-desktop-portal-gnome#recommended# testing that this is or is not making problems  #Backend implementation for xdg-desktop-portal for the GNOME desktop environment
	nirius#Utility commands for the niri wayland compositor
	niriswitcher#Application switcher for niri
	sunsetr#Automatic blue light filter for Hyprland, Niri, and everything Wayland
	swaylock
	swayidle
	swaybg# for wallpaper 
	iio-niri#Listen to iio-sensor-proxy and updates Niri output orientation depending on the accelerometer orientation
	gtk3# Required for GTK file chooser #GTK is a highly usable, feature rich toolkit for creating graphical user interfaces which boasts cross platform compatibility and an easy to use API. GTK it is written in C, but has bindings to many other popular programming languages such as C++, Python and C# among others. GTK is licensed under the GNU LGPL 2.1 allowing development of both free and proprietary software with GTK without any license fees or royalties.
  ];
#
programs.niri = {
	enable = true;
};
environment.sessionVariables = {
	_JAVA_AWT_WM_NONREPARENTING = "1";  # Java Swing fix
};
programs.xwayland.enable = true;  # Usually auto-enabled with Niri
}
