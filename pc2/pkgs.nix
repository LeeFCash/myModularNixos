{ config, lib, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
	git
	unzip
	nodejs_24
	yarn
	electron
	vim
	wget
#	brave
	(brave.override {
		commandLineArgs = "--password-store=basic";
	})
	blender
	neofetch
	kitty
	wofi
	waybar
	blueman
	hyprshot
	swaynotificationcenter
	pavucontrol
	discord-ptb
	tmux
	tree
	godot
	obs-studio
	# dolpin start
#	libsForQt5.dolphin # seems to no longer exist 
	kdePackages.dolphin # may have replaced libsForQt5.dolphin 
	kdePackages.dolphin-plugins
	kdePackages.kio-extras   # For thumbnails like images, PDFs, etc.
	kdePackages.breeze-icons # Default KDE icon theme
	hicolor-icon-theme       # Fallback icon theme
	adwaita-icon-theme # GTK compatibility
	# dolpin end
	vlc
	fuse
	handbrake
	libgbm
	lynx # terminal browser 
	ani-cli # anime in browser
	ardour # can be used for music royalty-free
	networkmanagerapplet
	nm-tray # also network manager
	prismlauncher
	htop
	zip
	distrobox
	boxbuddy
	#python2
	docker
	podman
	killall
	appimage-run
	video-downloader
	shotcut
	flowblade
	speedtest-cli
#	flatpak # don't seem to work
	libinput
	usbutils
	freetube # open source
	netbeans # for class and java
#	davinci-resolve # to test
#	jdk21_headless # for java without GUI stuff
	jdk # for jave with GUI stuff
#	atlauncher # minecrft lancher mods, servers(does not seem to work)
#	kiwix # Kiwix is open source. It is a free and open-source software project dedicated to providing offline access to free educational content, and its code is fully open-source and available for use, modification, and distribution.
	python312
	gimp
  ];

#nixpkgs.config.permittedInsecurePackages = [
#	"python-2.7.18.8"
#];

}
