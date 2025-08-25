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
	./only_for_AMD_GPUs.nix
#	./swayWM.nix
	./hyprland.nix
	./kdeP.nix
#	./davinciResolveOnlyAMDgpuMaybeCPUStillNotFullyWorking.nix
#	./davinciResolveStudioMaybeAMDonlyGPUandCPUuntested.nix
#	./Vbox.nix
	./virtManager.nix
	./steam.nix
	./alrv.nix
#	./flatpak.nix
	./bluetooth.nix
	./pcLagFixMaybe.nix
    ];
}
