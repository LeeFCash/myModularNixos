{ config, pkgs, lib, ... }:
{
# N
	networking = {
		firewall = {
			enable = true;
			allowedUDPPorts = [ 9943 9944 ]; # Explicitly open ALVR ports
			trustedInterfaces = [ "virbr0" ]; # Trust all traffic on virbr0
			#allowForwarding = true;
		};
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
		networkmanager = {
			wifi = {
				powersave = false;
			};
		};
	};
	nixpkgs.config.allowUnfree = true;
	nix = {
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" ];
		};
		gc = {
			automatic = true;
			dates = "hourly";
			options = "--delete-older-than 7d";
		};
	};
# E
	environment = {
		sessionVariables = {
			_JAVA_AWT_WM_NONREPARENTING = "1";  # Java Swing fix
			NIXOS_OZONE_WL = "1"; # Enable Wayland for Ozone apps # tells Steam (and other Ozone-based apps) to prefer Wayland, which is critical for compatibility with Gamescope in your Wayland-based NixOS setup. It’s a small but important setting to ensure your Gamescope session has the best chance of working. Let me know the results of the suggested checks or any specific errors!
		};
		systemPackages = with pkgs; [
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
			fuse# seems to be needed by gear lover 
			fuse2# seems to be needed by gear lover 
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
		#	python312
		#	python312Packages.flask
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
			appimage-run# their is a flatpak called Gear Lever that is a utility to manage AppImages with ease! Gear lever will organize and manage AppImage files for you, generate desktop entries and app metadata, update apps in-place or keep multiple versions side-by-side.
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
			libnotify# notify-send 
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
			jetbrains-toolbox
			jq# Lightweight and flexible command-line JSON processor # also needed for random win + tab = go to random window
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
	};
# P
	programs = {
		steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
			localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
			gamescopeSession.enable = true; # Enables integration with Gamescope, a compositing manager developed by Valve (used in Steam Deck’s gaming mode).Gamescope provides features like resolution scaling, frame rate limiting, and a streamlined gaming environment. Enabling this creates a session script that launches Steam with Gamescope, mimicking the Steam Deck’s “Gaming Mode” experience, useful for big-picture mode or gaming-focused setups.
		};
		sway = {
			enable = true;
		};
		alvr = {
			/*
				Make sure you have put the following line in your SteamVR launch options and restart it:
				/home/leecash/.local/share/Steam/steamapps/common/SteamVR/bin/vrmonitor.sh %command%
			*/
			enable = true;
			openFirewall = true;
		};
		hyprland = {
			enable = true;
		};
		gamemode = {
			enable = true;
		};
		nix-ld = {
			# expose libraries I added
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
		virt-manager = {
			enable = true;
		};
		dconf = {
			enable = true;
		};
		xwayland = {
			enable = true;  # Usually auto-enabled with Niri
		};
		niri = {
			enable = true;
		};
		neovim = {
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
				packages = { 
					myVimPackage = with pkgs.vimPlugins; {
						start = [
							#evaluation warning: 'vimPlugins.ctrlp' was renamed to 'vimPlugins.ctrlp-vim' on 2026-02-04. Please update to 'vimPlugins.ctrlp-vim'.
							ctrlp-vim
							nvim-cmp	
							cmp-nvim-lsp
							nvim-lspconfig
							cmp-buffer
							cmp-path
			#				nvim-jdtls# some error # 2026/3/04
						];
					};
			};
		};
		};
	};
# S
	security = {
		rtkit = {
			enable = true;
		};
		#journalctl --user -u wivrn (info like code)
		wrappers = {
			hyprland = {
				source = "${pkgs.hyprland}/bin/Hyprland";
				capabilities = "cap_sys_nice+ep";
				owner = "root";
				group = "root";
				permissions = "0755";
			};
		};
		#Fix real-time scheduling (reduce input lag) #don't know if this still matters since if I remeber right this was for something I already fixed
		pam = {
			loginLimits = [
				{ domain = "*"; type = "hard"; item = "rtprio"; value = "95"; }
				{ domain = "*"; type = "soft"; item = "rtprio"; value = "95"; }
			];
		};
	};
	system = {
		autoUpgrade = {
			enable = false;
			allowReboot = false;
			channel = "https://nixos.org/channels/nixos-unstable";
		};
	};
	services = {
		pipewire = {
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
		pulseaudio = {
			enable = false;
		};
		xserver = {
			enable = true; # for hyprland but not sure what it does
		};
		spice-vdagentd = {
			enable = true;
		};
		# L
		logind = {
			settings = {
				Login = {
					IdleAction = "ignore"; # the system doesn’t suspend or shut down on idle
					HandlePowerKey = "ignore"; # Ignore power button presses
					HandleLidSwitch = "ignore"; # Ignore lid closing
					#IdleActionSec = "30min"; # Timeout before idle action (if not ignored)
				};
			};
		};
		libinput = {
			enable = true; # for x11
		};
		# D
		desktopManager = {
			plasma6 = {
				enable = true;
			};
		};
		displayManager.sddm = {
		#
		#evaluation warning: The option `services.displayManager.sddm.autoLogin.user' defined in `/etc/nixos/myModularNixos/show/kdeP.nix' has been renamed to `services.displayManager.autoLogin.user'.
		#evaluation warning: The option `services.displayManager.sddm.autoLogin.enable' defined in `/etc/nixos/myModularNixos/show/kdeP.nix' has been renamed to `services.displayManager.autoLogin.enable'.
		#
			enable = true; # Enables SDDM as the display manager
			wayland = {
				enable = true; # Ensures Wayland support for Hyprland
			};
		##	autoLogin = {
		##		enable = true; # Enables auto-login
		##		user = "leecash"; # Automatically logs in as user "leecash"
		##	};
		};
		# F
		flatpak = {
			enable = true;
			/*
				commend - flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
				commend up to add remote
				to check if worked command - flatpak remotes (some info like name and options flathub system )
				use by command - flatpak install "name of what you want" - it will give you options
			*/
		};
	};
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
# X
	xdg = {
		# I added due to needing to have the portals for screen capture (steam Remote Play)
		portal = {
			enable = true;
			extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
			wlr = {
				enable = true;# I know not why but error
			};
		};
	};
	# B
	boot = {
		/*
			AI -
			Check your kernel:
			uname -r
			If you're not on latest, add:
			boot.kernelPackages = pkgs.linuxPackages_latest;
		*/
		extraModprobeConfig = ''
			options iwlwifi 11n_disable=1
		'';
		tmp = {
			cleanOnBoot = true;
		};
	};
	fonts = {
		packages = with pkgs; [
			nerd-fonts.fira-code
			nerd-fonts.droid-sans-mono
			nerd-fonts.noto
		];
	};
# P
	powerManagement = {
		/*
			set cpu to performance and have it managed by systemd
			services.cpupower.enable = true; # keeping just in case
			services.cpupower.governor = "performance"; # keeping just in case
		*/
		cpuFreqGovernor = "performance";
	};
# U
	users = {
		users = {
			leecash = {
				# Define a user account. Don't forget to set a password with ‘passwd’.
				isNormalUser = true;
				description = "LeeCash";
				extraGroups = [ "networkmanager" "wheel" "libvirtd" "openrazer" "seat" "gamemode" ];
				packages = with pkgs; [
					# user only stuff
				];
			};
		};
	};
# H
	hardware = {
		xone = {
			enable = true; # support for the xbox controller USB dongle
		};
		firmware = with pkgs; [ linux-firmware ];
		bluetooth = {
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
		graphics = {
			enable = true;
			enable32Bit = true; # Ensure compatibility with SteamVR
			#    extraPackages = with pkgs; [ amdvlk ];
			#'vaapiVdpau' has been renamed to/replaced by 'libva-vdpau-driver'
			extraPackages = with pkgs; [
#				vaapiVdpau
				libva-vdpau-driver
				libvdpau-va-gl
				vulkan-loader
				#vulkan-validation-layers
				# Remove vulkan-validation-layers for performance
				#rocm-opencl-runtime # For potential OpenCL acceleration( does not work as stated )
			];
		};
	};
}
