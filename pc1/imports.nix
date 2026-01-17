# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	./system.nix
	./gcAndUpgradeAndChannel.nix
	./users.nix
	./pkgs.nix
#	./only_for_AMD_GPUs.nix
#	./swayWM.nix
	./hyprland.nix
	./kdeP.nix
#	./davinciResolveOnlyAMDgpuMaybeCPUStillNotFullyWorking.nix
#	./davinciResolveStudioMaybeAMDonlyGPUandCPUuntested.nix
#	./Vbox.nix
	./virtManager.nix
	./steam.nix
	./alrv.nix
	./flatpak.nix
	./bluetooth.nix
	./cStuff.nix
	./niriWM.nix# works 
	./forNvidiaGPUs.nix
#	./noctalia.nix# not sure but what I have seems to be a flake / I as of 2025 - 10 - 12 (year - day - month ) I have not learned flakes
    ];
}
