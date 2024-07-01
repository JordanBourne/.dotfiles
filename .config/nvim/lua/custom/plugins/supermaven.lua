return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<C-\\>',
        clear_suggestion = '<C-]>',
        accept_word = '<C-j>',
      },
      color = {
        suggestion_color = '#e5c6f7',
        cterm = 244,
      },
    }

    vim.keymap.set('n', '<leader>mt', '<cmd>SupermavenToggle<cr>', { desc = 'Toggle SuperMaven' })
  end,
}
