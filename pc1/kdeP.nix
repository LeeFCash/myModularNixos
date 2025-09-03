{ config, pkgs, lib, ... }:

{
# hyprland and hyprland stuff
services.xserver.enable = true;
# services.xserver.displayManager.sddm.enable = true;  # SDDM is the recommended display manager for Plasma
# services.xserver.desktopManager.plasma6.enable = true;  # Enable KDE Plasma
services.desktopManager.plasma6.enable = true;
#services.displayManager.sddm.enable = true;
#evaluation warning: The option `services.displayManager.sddm.autoLogin.user' defined in `/etc/nixos/myModularNixos/show/kdeP.nix' has been renamed to `services.displayManager.autoLogin.user'.
#evaluation warning: The option `services.displayManager.sddm.autoLogin.enable' defined in `/etc/nixos/myModularNixos/show/kdeP.nix' has been renamed to `services.displayManager.autoLogin.enable'.
services.displayManager.sddm = {
	enable = true; # Enables SDDM as the display manager
	wayland.enable = true; # Ensures Wayland support for Hyprland
##	autoLogin = {
##		enable = true; # Enables auto-login
##		user = "leecash"; # Automatically logs in as user "leecash"
##	};
};
#services.displayManager.autoLogin = {
#	enable = true; # Enables auto-login
#	user = "leecash"; # Automatically logs in as user "leecash"
#};
xdg.portal.enable = true;
# services.xserver.libinput.enable = true; # for x11 outdated
services.libinput.enable = true; # for x11
#hardware.services = {
#  enable = true;
#  driSupport = true;
#  driSupport32Bit = true;
#};
}
