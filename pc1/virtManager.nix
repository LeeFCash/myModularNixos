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
	spice 
	spice-gtk
	spice-protocol
#	win-virtio
	virtio-win
	win-spice
	dnsmasq
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
