{ config, pkgs, lib, ... }:

{
# hyprland and hyprland stuff
services.xserver.enable = true;
# services.xserver.displayManager.sddm.enable = true;  # SDDM is the recommended display manager for Plasma
# services.xserver.desktopManager.plasma6.enable = true;  # Enable KDE Plasma
services.desktopManager.plasma6.enable = true;
services.displayManager.sddm.enable = true;
xdg.portal.enable = true;
# services.xserver.libinput.enable = true; # for x11 outdated
services.libinput.enable = true; # for x11
#hardware.services = {
#  enable = true;
#  driSupport = true;
#  driSupport32Bit = true;
#};
}
