return  {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "H", "<CMD>BufferPrevious<CR>", opts)
      vim.keymap.set("n", "L", "<CMD>BufferNext<CR>", opts)
      vim.keymap.set("n", "<leader>q", "<CMD>BufferClose<CR>", opts)
      end
  },
}
