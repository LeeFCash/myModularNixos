{ config, lib, pkgs, ... }:

{

#networking.firewall.enable = false; # test 

networking.firewall = {
  enable = true;
  trustedInterfaces = [ "virbr0" ]; # Trust all traffic on virbr0
  #allowForwarding = true;
};

programs.dconf.enable = true;
programs.virt-manager.enable = true;
  
#'win-virtio' has been renamed to/replaced by 'virtio-win'
environment.systemPackages = with pkgs; [
	virt-manager
	virt-viewer
	spice#Complete open source solution for interaction with virtualized desktop devices
	spice-gtk
	spice-protocol
#	win-virtio
	virtio-win
	win-spice
	dnsmasq
	virglrenderer#Virtual 3D GPU for use inside QEMU virtual machines
	qemu_kvm#Generic and open source machine emulator and virtualizer
	libvirt#Toolkit to interact with the virtualization capabilities of recent versions of Linux and other OSes
];
  
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


}
