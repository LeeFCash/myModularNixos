{ config, pkgs, lib, ... }:

{
# ...
services.flatpak.enable = true;
# commend - flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# commend up to add remote 
# to check if worked command - flatpak remotes (some info like name and options flathub system )
# use by command - flatpak install "name of what you want" - it will give you options
}
