--Makes space the leader character
vim.g.mapleader = " "

vim.opt.mouse = ""

vim.opt.number = true

vim.opt.hlsearch = true

-- Use ctrl-[hjkl] to select the active split!
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when tanking text", 
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Use -/+ for resizing windows 
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) 
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) 
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) 
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) 

-- Quick open Neotree
vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })



-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
	  -- PLUGINS GO HERE PLUGINS GO HERE
	  -- PLUGINS GO HERE PLUGINS GO HERE
	  -- PLUGINS GO HERE PLUGINS GO HERE
	  -- PLUGINS GO HERE PLUGINS GO HERE
	  -- PLUGINS GO HERE PLUGINS GO HERE
	  -- PLUGINS GO HERE PLUGINS GO HERE




    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },


{
    "sbdchd/neoformat",
    config = function()
      -- Optional: Setup an autocommand to format on save
      vim.cmd([[
        augroup FormatOnSave
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat
        augroup END
      ]])
    end,
  },




{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
      	"nvim-lua/plenary.nvim",
      	"nvim-tree/nvim-web-devicons", 
      	"MunifTanjim/nui.nvim",
  }
},

{
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.8',
-- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' }
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})



-- Load and configure Telescope
local telescope = require('telescope')

telescope.setup {
    defaults = {
        layout_config = {
            preview_cutoff = 120,
            horizontal = {
                preview_width = 0.6,
            },
        },
    },
    pickers = {
        find_files = {
            previewer = true,
        },
    },
}

-- Load built-in pickers for keymaps
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })




vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

