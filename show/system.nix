{ config, pkgs, lib, ... }:

{
# Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

# self added but is for(not 100%) Power button presses / Lid switches (on laptops) / Idle timeout behavior
  services.logind.extraConfig = ''
	IdleAction=ignore
  '';

# I added due to needing to have the portals for screen capture (steam Remote Play)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

# Configure /tmp to use tmpfs.
#  fileSystems."/tmp" = {
#	device = "tmpfs";
#	fsType = "tmpfs";
#	options = [ "mode=1777" "nosuid" "nodev" ];
#  };

boot.tmp.cleanOnBoot = true;

# expose libraries I added
   programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib
      gtk3
      libxkbcommon
      xorg.libX11
      xorg.libXext
      xorg.libXcursor
      xorg.libXrandr
      xorg.libXdamage
      xorg.libXcomposite
      xorg.libXtst
      xorg.libXfixes
      xorg.libXScrnSaver
      mesa
#      mesa.drivers
      nss
      nspr
      alsa-lib
      cups
      libpulseaudio
      dbus
      expat
      at-spi2-core
      pango
      cairo
      gdk-pixbuf
      libdrm
    ];
  };

fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  nerd-fonts.noto
  ];

  # for hyprland but not sure what it does
  services.xserver.enable = true;
  # services.xserver.libinput.enable = true; # was renamed to services.libinput.enable
  services.libinput.enable = true;

  # set cpu to performance and have it managed by systemd
  # services.cpupower.enable = true; # keeping just in case
  # services.cpupower.governor = "performance"; # keeping just in case
  powerManagement.cpuFreqGovernor = "performance";

}
