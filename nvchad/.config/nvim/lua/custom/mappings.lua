local M = {}

M.general = {
  n = {
    ["<leader><leader>"] = { "<cmd> noh<CR>" },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>bd"] = { "<cmd> Bdelete<CR>" },
    ["<leader>bw"] = { "<cmd> Bwipeout<CR>" },
  }
}

return M
