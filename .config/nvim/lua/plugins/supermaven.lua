return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<C-y>',
        clear_suggestion = '<C-x>',
        accept_word = '<C-l>',
      },
      color = {
        suggestion_color = '#e5c6f7',
        cterm = 244,
      },
      disable_inline_completion = false,
    }

    vim.keymap.set('n', '<leader>mt', '<cmd>SupermavenToggle<cr>', { desc = 'Toggle SuperMaven' })
  end,
}
