-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'morhetz/gruvbox', config = function()
        vim.cmd("let g:gruvbox_transparent_bg = 1")
        vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
        vim.cmd("colorscheme gruvbox")
    end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use('jiangmiao/auto-pairs')
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "MunifTanjim/nui.nvim" },
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
    use('nvim-tree/nvim-web-devicons')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use('github/copilot.vim')

    --- Vimtex for LaTeX editing
    use {
        "lervag/vimtex",
        run = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
                build_dir = '',
                callback = 1,
                continuous = 1,
                executable = 'latexmk',
                options = {
                    "-pdf",
                    "-shell-escape",
                    "-verbose",
                    "-file-line-error",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                }
            }
        end
    }
end)
