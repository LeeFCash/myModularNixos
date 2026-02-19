{ config, pkgs, lib, ... }:
{
nixpkgs.config.allowUnfree = true;
#nixpkgs.config.allowUnsupportedSystem = true;
environment.systemPackages = with pkgs; [
# G
	gtk3# also for alvr # I had this for niri but I don't remember why # Required for GTK file chooser #GTK is a highly usable, feature rich toolkit for creating graphical user interfaces which boasts cross platform compatibility and an easy to use API. GTK it is written in C, but has bindings to many other popular programming languages such as C++, Python and C# among others. GTK is licensed under the GNU LGPL 2.1 allowing development of both free and proprietary software with GTK without any license fees or royalties.
	git
	gimp2
	godot
	gopls# language server
	gradle# seems to be for java development #for minecraft modding
	gcc # for c++
# U
	unzip
	unityhub#test
	usbutils
# N
	niri
	nirius#Utility commands for the niri wayland compositor
	niriswitcher#Application switcher for niri
	nodejs_24
	nodePackages.typescript-language-server# language server
	nodePackages.bash-language-server# language server
	neofetch
	networkmanagerapplet
	nh# nixos package search
# E
	electron
	easyeffects# Audio effects for PipeWire applications
# W
	wget
	wofi
	waybar# the bar at the top this is
	win-spice# for virt manager vm
	wlr-randr#alvr
# F
	firefox
	file#file info
	fuse
	fuzzel# forgot what this was but it has something to do with niri
	flowblade
	freetube # open source
	ffmpeg#alvr
# B
	(brave.override {
		commandLineArgs = "--password-store=basic";
	})
	blender
	blueman
	boxbuddy
	bash
	btop#alvr
# K
	kitty# for hyprland
	kdePackages.dolphin         # may have replaced libsForQt5.dolphin
	kdePackages.dolphin-plugins
	kdePackages.kio-extras      # for dolphin # For thumbnails like images, PDFs, etc.
	kdePackages.breeze-icons    # for dolphin # Default KDE icon theme
# H
	hyprshot
	hicolor-icon-theme          # for dolphin # Fallback icon theme
	handbrake
	htop
# S
	swaynotificationcenter
	swaylock# lock screen for niri
	swayidle# also for niri
	swaybg# for wallpaper for niri
	sunsetr#Automatic blue light filter for Hyprland, Niri, and everything Wayland
	spice# for virt manager vm #Complete open source solution for interaction with virtualized desktop devices
	spice-gtk# for virt manager vm
	spice-protocol# for virt manager vm
	sidequest#alvr
# P
	pavucontrol#alvr
	prismlauncher
	pyright# language servers
	#podman
# D
	discord-ptb
	distrobox
	#docker
	dotnet-sdk # for c#
	dnsmasq# for virt manager vm
# T
	teams-for-linux
	tmux
	tree
# O
	obs-studio
	openssl#alvr
# A
	adwaita-icon-theme          # for dolphin # GTK compatibility
	android-tools #for (I think)alvr and For adb
	ani-cli # anime in browser
	ardour # can be used for music royalty-free
	audacity# Sound editor with graphical UI
	alacritty
	alvr
	alsa-lib#alvr
	#appimage-run
# V
	vlc
	#vim
	video-downloader
	virglrenderer# for virt manager vm #Virtual 3D GPU for use inside QEMU virtual machines
	virtio-win# for virt manager vm
	virt-manager# for virt manager vm
	virt-viewer# for virt manager vm
	vulkan-loader#alvr
	vulkan-tools#alvr
# L
	libvirt# for virt manager vm #Toolkit to interact with the virtualization capabilities of recent versions of Linux and other OSes
	libva#alvr
	libgbm
	libdrm#alvr
	libinput
	(lutris.override {
		extraPkgs = pkgs: [
# evaluation warning: 'wineWowPackages' is deprecated as it is no longer preferred by upstream. Use wineWow64Packages instead
			pkgs.winetricks
			pkgs.wineWow64Packages.stagingFull
			pkgs.wineWow64Packages.waylandFull
			pkgs.wineWow64Packages.yabridge
		];
	}
	)
	lynx # terminal browser
# Z
	zip
# S
	shotcut
	speedtest-cli
	spotify
# J
	jdk # for jave with GUI stuff
	jdt-language-server# language server
	jetbrains.idea-oss#modding minecraft
# M
	mission-center# Monitor your CPU, Memory, Disk, Network and GPU usage / can stop stuff I think
	mesa#alvr
	mangohud#alvr
# C
	clang-tools# language server
# R
	rust-analyzer#language server
# X
	xwayland-satellite#Xwayland outside your Wayland compositor # have this for niri
	x264#alvr
# I
	iio-niri#Listen to iio-sensor-proxy and updates Niri output orientation depending on the accelerometer orientation
# Q
	qemu_kvm# for virt manager vm #Generic and open source machine emulator and virtualizer
  ];

#nixpkgs.config.permittedInsecurePackages = [
#	"python-2.7.18.8"
#];
#];
programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
	configure = {
		customRC = ''
			set runtimepath^=${pkgs.vimPlugins.jellybeans-vim}
			colorscheme jellybeans
			set number
			set relativenumber
			set cc=100
			set list
			set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
			if &diff
				colorscheme blue
			endif
		'';
		packages.myVimPackage = with pkgs.vimPlugins; {
			start = [
#evaluation warning: 'vimPlugins.ctrlp' was renamed to 'vimPlugins.ctrlp-vim' on 2026-02-04. Please update to 'vimPlugins.ctrlp-vim'.
				ctrlp-vim
				nvim-cmp	
				cmp-nvim-lsp
				nvim-lspconfig
				cmp-buffer
				cmp-path
				nvim-jdtls
			];
		};
	};
};
/* just so I don't forget 
configure = {
		customRC = ''
			set runtimepath^=${pkgs.vimPlugins.jellybeans-vim}
			colorscheme jellybeans
			set number
			set relativenumber
			set cc=100
			set list
			set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
			if &diff
				colorscheme blue
			endif
			-- auto fill --
			lua << EOF
			local lspconfig = require("lspconfig")
			local cmp = require("cmp")
			-- capabilities: tell LSPs we support completion
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- list of servers to auto-enable
			local servers = {
				"tsserver",
				"pyright",
				"bashls",
				"clangd",
				"gopls",
				"rust_analyzer",
				"lua_ls",
				"jdtls"
			}
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					capabilities = capabilities,
				}
			end
			-- nvim-cmp setup (generic, works(most) for all languages)
			cmp.setup {
				mapping = {
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
			}
			EOF
		'';
		packages.myVimPackage = with pkgs.vimPlugins; {
			start = [
				ctrlp
				nvim-cmp	
				cmp-nvim-lsp
				nvim-lspconfig
				cmp-buffer
				cmp-path
				nvim-jdtls
			];
*/
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
# services.xserver.libinput.enable = true; # for x11 outdated
services.libinput.enable = true; # for x11
/*
hardware.services = {
  enable = true;
  driSupport = true;
  driSupport32Bit = true;
};
*/
services.flatpak.enable = true;
/*
commend - flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
commend up to add remote
to check if worked command - flatpak remotes (some info like name and options flathub system )
use by command - flatpak install "name of what you want" - it will give you options
*/
system.autoUpgrade = {
	enable = false;
	allowReboot = false;
	channel = "https://nixos.org/channels/nixos-unstable";
  };
# nix package managent
  nix = {
	settings.auto-optimise-store = true;
	gc = {
		automatic = true;
		dates = "hourly";
		options = "--delete-older-than 7d";
	};

  };
#
programs.niri = {
	enable = true;
};
environment.sessionVariables = {
	_JAVA_AWT_WM_NONREPARENTING = "1";  # Java Swing fix
};
programs.xwayland.enable = true;  # Usually auto-enabled with Niri
#networking.firewall.enable = false; # test
programs.dconf.enable = true;
programs.virt-manager.enable = true;

  virtualisation = {
	libvirtd = {
		enable = true;
      		qemu = {
        	swtpm.enable = true;
        	#ovmf.enable = true;# not sure but may have been removed
        	#ovmf.packages = [ pkgs.OVMFFull.fd ];# not sure but may have been removed
		#vhostUserPackages = with pkgs; [ virtiofsd ];
		#secureBoot = true;
        	#tpmSupport = true;

      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  nix.settings.experimental-features = [ "nix-command" ];
# self added but is for(not 100%) Power button presses / Lid switches (on laptops) / Idle timeout behavior
#  services.logind.extraConfig = '' # not being used anymore
#	IdleAction=ignore
#  '';
#
services.logind.settings = {
	Login = {
		IdleAction = "ignore"; # the system doesn’t suspend or shut down on idle
		HandlePowerKey = "ignore"; # Ignore power button presses
		HandleLidSwitch = "ignore"; # Ignore lid closing
#		IdleActionSec = "30min"; # Timeout before idle action (if not ignored)
	};
};

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
/*
evaluation warning: The xorg package set has been deprecated, 'xorg.libX11' has been renamed to 'libx11'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXext' has been renamed to 'libxext'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXcursor' has been renamed to 'libxcursor'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXcomposite' has been renamed to 'libxcomposite'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXrandr' has been renamed to 'libxrandr'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXdamage' has been renamed to 'libxdamage'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXtst' has been renamed to 'libxtst'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXfixes' has been renamed to 'libxfixes'
evaluation warning: The xorg package set has been deprecated, 'xorg.libXScrnSaver' has been renamed to 'libxscrnsaver'
*/
	# G
		glib
		gtk3
		gdk-pixbuf
	# L
		libpulseaudio
		libdrm
		libxkbcommon
		libx11
		libxext
		libxcursor
		libxcomposite
		libxrandr
		libxdamage
		libxtst
		libxfixes
		libxscrnsaver
	# X
	# M
		mesa
	# N
		nss
		nspr
	# A
		alsa-lib
		at-spi2-core
	# C
		cups
		cairo
	# D
		dbus
	# E
		expat
	# P
		pango
    ];
  };
fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	nerd-fonts.droid-sans-mono
	nerd-fonts.noto
];

services.xserver.enable = true; # for hyprland but not sure what it does
/*
set cpu to performance and have it managed by systemd
services.cpupower.enable = true; # keeping just in case
services.cpupower.governor = "performance"; # keeping just in case
*/
powerManagement.cpuFreqGovernor = "performance";
/*
AI -
Even if you haven’t set it manually, Intel cards default to aggressive power saving

networking.networkmanager.wifi.powersave = false;

this is recommeded by AI -
The 3168 is notorious for crashing in 802.11n mode.    (if I understand right disable Wi-Fi N high-throughput mode)
Add this to your NixOS config:

boot.extraModprobeConfig = ''
  options iwlwifi 11n_disable=1
'';

This disables Wi-Fi N high-throughput mode, which often stabilizes the card completely.
You lose some max speed, but gaming stability improves massively.
*/
networking.networkmanager.wifi.powersave = false;
boot.extraModprobeConfig = ''
  options iwlwifi 11n_disable=1
'';
/*
AI -
Check your kernel:
uname -r
If you're not on latest, add:
boot.kernelPackages = pkgs.linuxPackages_latest;
*/
# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.leecash = {
	isNormalUser = true;
	description = "LeeCash";
	extraGroups = [ "networkmanager" "wheel" "libvirtd" "openrazer" "seat" ];
	packages = with pkgs; [
		# user only stuff
	];
};
/*
# c# tested and worked but the output was not the same -
#// See https://aka.ms/new-console-template for more information
#Console.WriteLine("Hello, World!");
#which is newer and the reason why and the code if typed yourself and also works is also the same as -
#using System;
#class Program
#{
#    static void Main(string[] args)
#    {
#        Console.WriteLine("Hello, C#!");
#    }
#}

# warning I used AI for this info down/under

#mkdir MyCSharpApp
#cd MyCSharpApp
#dotnet new console #This creates a basic console application with a Program.cs file

#using System;
#class Program
#{
#    static void Main(string[] args)
#    {
#        Console.WriteLine("Hello, C#!");
#    }
#}

# Build and run the program # dotnet run
# C# does not require gcc or g++. The .NET SDK includes everything needed to compile and run C# code. It uses its own compiler (csc) and runtime.

# c# up / c++ down

#To write, compile, and run C++ programs, you need a C++ compiler. The most common choice is g++, which is part of the GNU Compiler Collection (gcc). On NixOS, you can install gcc (which includes g++ for C++) using the Nix package manager.

#test if works -
#include <iostream>
#int main() {
#    std::cout << "Hello, C++!" << std::endl;
#    return 0;
#}

# compile it : g++ hello.cpp -o hello
#Run the program : ./hello
*/
# hyprland and hyprland stuff
  programs.hyprland.enable = true;
  xdg.portal.wlr.enable = true;
#Fix real-time scheduling (reduce input lag) #don't know if this still matters since if I remeber right this was for something I already fixed
  security.pam.loginLimits = [
  { domain = "*"; type = "hard"; item = "rtprio"; value = "95"; }
  { domain = "*"; type = "soft"; item = "rtprio"; value = "95"; }
];
  security.wrappers.hyprland = {
	source = "${pkgs.hyprland}/bin/Hyprland";
	capabilities = "cap_sys_nice+ep";
	owner = "root";
	group = "root";
	permissions = "0755";
  };

#journalctl --user -u wivrn (info like code)

#'vaapiVdpau' has been renamed to/replaced by 'libva-vdpau-driver'

hardware.graphics = {
	enable = true;
	enable32Bit = true; # Ensure compatibility with SteamVR
#    extraPackages = with pkgs; [ amdvlk ];
	extraPackages = with pkgs; [
#		vaapiVdpau
		libva-vdpau-driver
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
	trustedInterfaces = [ "virbr0" ]; # Trust all traffic on virbr0
	#allowForwarding = true;
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
/*
Make sure you have put the following line in your SteamVR launch options and restart it:
/home/leecash/.local/share/Steam/steamapps/common/SteamVR/bin/vrmonitor.sh %command%
*/
hardware.bluetooth = {
	enable = true;
	settings = {
		General = {
			Enable = "Source,Sink,Media,Socket";
			ControllerMode = "dual"; # Supports both classic and BLE devices
			Experimental = true; # Enables experimental features, which may help
		};
	Policy = {
		AutoEnable = true; # Automatically enables Bluetooth on boot
	};
	};
};
hardware.firmware = with pkgs; [ linux-firmware ];
# Sway like hyprland seems but is not the same
  programs.sway.enable = true;  # Or programs.hyprland.enable = true;
  # steam Configuration
  programs.steam = {
  	enable = true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
	localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	gamescopeSession.enable = true; # Enables integration with Gamescope, a compositing manager developed by Valve (used in Steam Deck’s gaming mode).Gamescope provides features like resolution scaling, frame rate limiting, and a streamlined gaming environment. Enabling this creates a session script that launches Steam with Gamescope, mimicking the Steam Deck’s “Gaming Mode” experience, useful for big-picture mode or gaming-focused setups.
  };
hardware.xone.enable = true; # support for the xbox controller USB dongle
environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Enable Wayland for Ozone apps # tells Steam (and other Ozone-based apps) to prefer Wayland, which is critical for compatibility with Gamescope in your Wayland-based NixOS setup. It’s a small but important setting to ensure your Gamescope session has the best chance of working. Let me know the results of the suggested checks or any specific errors!
# Vulkan for games (adjust for your GPU: amd/nvidia/intel)
#hardware.steam-hardware.enable = true;  # Pulls in Vulkan layers # should work without even in niri WM #Bottom line: Leave it commented/disabled. It's redundant (and could conflict if explicit). Your Xbox dongle uses hardware.xone instead, which is correct. #If you do have a Steam Controller/Vive acting up (e.g., journalctl -u systemd-udevd | grep uinput shows permission errors), uncomment it – but test games first post-rebuild. Vulkan layers? Totally separate (handled by hardware.opengl or Mesa drivers). No relation.
}
