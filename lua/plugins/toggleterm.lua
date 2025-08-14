return {
  'akinsho/toggleterm.nvim',
  version = "*", -- or a specific version tag
  config = function()
    require('toggleterm').setup({
      direction = 'float',      
      float_opts = {
        border = 'single', -- 'single', 'double', 'shadow', 'curved'
      },
    })

    -- Custom function to set keymaps specifically for terminal buffers
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Use 'jk' to exit terminal mode
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      -- Close the terminal with the same key used to open it
      vim.keymap.set('t', '<leader>t', [[<Cmd>ToggleTerm<CR>]], opts)
    end

    -- Use an autocommand to run the function when a terminal is opened
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*',
      callback = function()
        set_terminal_keymaps()
      end,
    })
  end,
}
