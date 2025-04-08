require "nvchad.mappings"

vim.opt.relativenumber = true


local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map('i', '<C-c>', '<Esc>', {noremap = true})

-- Open floating diagnostics window
map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Open floating diagnostics" })

-- Go to previous diagnostic
map("n", "<leader>cj", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

-- Go to next diagnostic
map("n", "<leader>ck", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
