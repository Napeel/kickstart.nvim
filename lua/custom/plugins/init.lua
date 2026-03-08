-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'zaldih/themery.nvim',
    config = function()
      require('themery').setup {
        themes = {
          {
            name = 'Monet',
            colorscheme = 'monet',
            before = [[
              require('monet').setup {
                transparent_background = false,
                semantic_tokens = true,
                dark_mode = true,
                highlight_overrides = {},
                color_overrides = {},
                styles = {},
              }
            ]],
          },
          { name = 'Rosé Pine', colorscheme = 'rosepine' },
          { name = 'Rosé Pine Moon', colorscheme = 'rosepine_moon' },
          { name = 'Rosé Pine Dawn', colorscheme = 'rosepine_dawn' },
        },
        livePreview = true,
        globalAfter = [[
          vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
          vim.cmd('highlight NormalNC ctermbg=NONE guibg=NONE')
          vim.cmd('highlight SignColumn ctermbg=NONE guibg=NONE')
          vim.cmd('highlight LineNr ctermbg=NONE guibg=NONE')
        ]],
      }
    end,
  },
  { 'rose-pine/vim', name = 'rose-pine' },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf', build = './install --all' },
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
      },
    },
  },
}
