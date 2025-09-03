{ config, pkgs, lib, ... }:

{
# VirtualBox Oracle
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "leecash" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  boot.blacklistedKernelModules = [ "kvm_amd" "kvm" ]; # seems to be what causes error if it don't have this
}
