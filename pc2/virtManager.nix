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
  
environment.systemPackages = with pkgs; [
	virt-manager
	virt-viewer
	spice 
	spice-gtk
	spice-protocol
	win-virtio
	win-spice
	dnsmasq
];
  
  virtualisation = {
	libvirtd = {
		enable = true;
      		qemu = {
        	swtpm.enable = true;
        	ovmf.enable = true;
        	ovmf.packages = [ pkgs.OVMFFull.fd ];
		#vhostUserPackages = with pkgs; [ virtiofsd ];
		#secureBoot = true;
        	#tpmSupport = true;

      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;


}
