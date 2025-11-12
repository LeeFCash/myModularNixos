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
#	mako#notification daemon
#	swaybg#A wallpaper utility for Wayland compositors, that is compatible with any Wayland compositor which implements the following Wayland protocols: wlr-layer-shell, xdg-output, and xdg-shell.
	wlrctl
	xdg-desktop-portal-gnome#recommended#Backend implementation for xdg-desktop-portal for the GNOME desktop environment
	nirius#Utility commands for the niri wayland compositor
	niriswitcher#Application switcher for niri
	sunsetr#Automatic blue light filter for Hyprland, Niri, and everything Wayland
#	stardust-xr-kiara#360-degree app shell / DE for Stardust XR using Niri
	iio-niri#Listen to iio-sensor-proxy and updates Niri output orientation depending on the accelerometer orientation
	kdePackages.polkit-kde-agent-1#Daemon providing a Polkit authentication UI for Plasma
	xdg-desktop-portal-gnome#Backend implementation for xdg-desktop-portal for the GNOME desktop environment
	xdg-desktop-portal-gtk#Desktop integration portals for sandboxed apps
	gnome-keyring#do not like but might be needed #Collection of components in GNOME that store secrets, passwords, keys, certificates and make them available to applications
	seatd#Minimal seat management daemon, and a universal seat management library
	gtk3# Required for GTK file chooser #GTK is a highly usable, feature rich toolkit for creating graphical user interfaces which boasts cross platform compatibility and an easy to use API. GTK it is written in C, but has bindings to many other popular programming languages such as C++, Python and C# among others. GTK is licensed under the GNU LGPL 2.1 allowing development of both free and proprietary software with GTK without any license fees or royalties.
  ];
#
programs.niri.enable = true;
#
#programs.niri = {
#	enable = true;
#	settings = {
#		environment = {
#			CLUTTER_BACKEND = "wayland";
#			DISPLAY = null;
#			GDK_BACKEND = "wayland,x11";
#			MOZ_ENABLE_WAYLAND = "1";
#			NIXOS_OZONE_WL = "1";
#			QT_QPA_PLATFORM = "wayland;xcb";
#			QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
#			SDL_VIDEODRIVER = "wayland";
#		};
#		spawn-at-startup = [
#			{command = ["brave"];}
#		];
#		input = {
#			focus-follows-mouse = {
#				enable = true;
#				max-scroll-amount = "90%";
#			};
#		warp-mouse-to-focus.enable = true;
#		}
#	}
#}
#
#services.displayManager.sddm = {
#    wayland.enable = true;
#    enable = true;
#  };
#
# === Essential Portals & Daemons ===
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
# Required for portals to start
services.dbus.enable = true;
#systemd.user.services.xdg-desktop-portal = {
#  enable = true;
#};
services.gnome.gnome-keyring.enable = true;
# === Seat & Input ===
security.polkit.enable = true;
services.seatd.enable = true;  # Required for multi-seat / wayland
programs.waybar.enable = false;# seems to not work# non working warbar and 2 of them without changing anything in niri config
# === Environment Variables (Critical for Electron, Java, etc.) ===
environment.sessionVariables = {
	NIXOS_OZONE_WL = "1";           # Electron/Chromium
	_JAVA_AWT_WM_NONREPARENTING = "1";  # Java Swing fix
	GDK_BACKEND = "wayland";
	QT_QPA_PLATFORM = "wayland";
	SDL_VIDEODRIVER = "wayland";
	MOZ_ENABLE_WAYLAND = "1";
};
# For X11 apps (Steam/Discord fallback)
programs.xwayland.enable = true;  # Usually auto-enabled with Niri
}
