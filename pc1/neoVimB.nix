{ config, pkgs, lib, ... }:
{
environment.systemPackages = with pkgs; [
#	core
	nodejs
	python3
	jdk
	lua
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
			-- auto fill --
			lua << EOF
			local lspconfig = require("lspconfig")
			local cmp = require("cmp")
			-- capabilities: tell LSPs we support completion
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- list of servers to auto-enable
			local servers = {
				"tsserver",
				"pyright",
				"bashls",
				"clangd",
				"gopls",
				"rust_analyzer",
				"lua_ls",
				"jdtls"
			}
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					capabilities = capabilities,
				}
			end
			-- nvim-cmp setup (generic, works(most) for all languages)
			cmp.setup {
				mapping = {
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
			}
			EOF
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
