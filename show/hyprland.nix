{ config, pkgs, lib, ... }:

{
# hyprland and hyprland stuff
  programs.hyprland.enable = true;
  xdg.portal.wlr.enable = true;

#Fix real-time scheduling (reduce input lag)
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
}
