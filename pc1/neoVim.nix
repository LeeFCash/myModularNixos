{ config, pkgs, lib, ... }:
{
environment.systemPackages = with pkgs; [
#	core
#	nodejs
#	python3
#	jdk
#	lua# I added thinking it may help
# language servers
	nodePackages.typescript-language-server
#	nodePackages.pyright
	pyright# seems to be this
	nodePackages.bash-language-server
	clang-tools
	gopls
	rust-analyzer
#	lua-language-server
	jdt-language-server
];
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
				ctrlp
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
}
