{ config, lib, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
	alvr
#	rustup
#	yasm
	libdrm
#	pkg-config
#	vulkan-headers
	vulkan-loader
	vulkan-tools
	libva
#	libva-utils
	openssl
#	libjack2
#	jack2
	alsa-lib
	gtk3
	mesa
#	unzip
	x264
	ffmpeg
	sidequest
	android-tools # For adb
	pavucontrol
#	clang
#	wivrn
	wlr-randr
# Why: htop/btop monitor CPU/GPU usage; mangohud overlays FPS and resource usage in VR games.
	htop
	btop
	mangohud
  ];

#journalctl --user -u wivrn (info like code)

hardware.graphics = {
	enable = true;
	enable32Bit = true; # Ensure compatibility with SteamVR
#    extraPackages = with pkgs; [ amdvlk ];
	extraPackages = with pkgs; [
		vaapiVdpau
		libvdpau-va-gl
		vulkan-loader
#		vulkan-validation-layers
# Remove vulkan-validation-layers for performance
#		rocm-opencl-runtime # For potential OpenCL acceleration( does not work as stated )
];
  };

networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 9943 9944 ]; # Explicitly open ALVR ports
  };

programs.alvr.enable = true;
programs.alvr.openFirewall = true;

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

#Make sure you have put the following line in your SteamVR launch options and restart it:
#/home/leecash/.local/share/Steam/steamapps/common/SteamVR/bin/vrmonitor.sh %command%


}
