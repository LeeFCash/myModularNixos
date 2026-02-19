{ config, lib, pkgs, ... }:

{
nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; [
	git
	gimp2
	godot
	gradle#for minecraft modding 
	unzip
	unityhub#test
	usbutils
	nodejs_24
#	neovim
	neofetch
	networkmanagerapplet
	nh# nixos package search 
	electron
	easyeffects# Audio effects for PipeWire applications
	wget
	wofi
	waybar
	firefox
	file#file info
	fuse
	flowblade
	freetube # open source
	(brave.override {
		commandLineArgs = "--password-store=basic";
	})
	blender
	blueman
	boxbuddy
	bash
	kitty
	kdePackages.dolphin         # may have replaced libsForQt5.dolphin 
	kdePackages.dolphin-plugins
	kdePackages.kio-extras      # for dolphin # For thumbnails like images, PDFs, etc.
	kdePackages.breeze-icons    # for dolphin # Default KDE icon theme
	hyprshot
	swaynotificationcenter
	pavucontrol
	prismlauncher
#	podman
	discord-ptb
	distrobox
#	docker
	tmux
	tree
	obs-studio
	hicolor-icon-theme          # for dolphin # Fallback icon theme
	handbrake
	htop
	adwaita-icon-theme          # for dolphin # GTK compatibility
	ani-cli # anime in browser
	ardour # can be used for music royalty-free
	audacity# Sound editor with graphical UI
#	appimage-run
	vlc
#	vim
	video-downloader
	libgbm
	libinput
	(lutris.override {
		extraPkgs = pkgs: [
			pkgs.wineWowPackages.stagingFull
			pkgs.winetricks
			pkgs.wineWowPackages.waylandFull
			pkgs.wineWowPackages.yabridge
		];
	}
	)
	lynx # terminal browser 
	zip
	shotcut
	speedtest-cli
	spotify
	jdk # for jave with GUI stuff
	jetbrains.idea-community-src#modding minecraft # seems to be changed to jetbrains.idea-oss
	mission-center# Monitor your CPU, Memory, Disk, Network and GPU usage / can stop stuff I think
  ];

#nixpkgs.config.permittedInsecurePackages = [
#	"python-2.7.18.8"
#];

}
