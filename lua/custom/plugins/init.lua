-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'daedlock/matugen.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('matugen').setup {}
      vim.cmd.colorscheme 'matugen'
      local function make_transparent()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
      end
      make_transparent()
      vim.api.nvim_create_autocmd({ 'ColorScheme', 'User' }, {
        pattern = { 'matugen', 'MatugenReloaded' },
        callback = make_transparent,
      })
    end,
  },
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
          {
            name = 'Lume',
            colorscheme = 'lume',
            before = [[
              require('lume').setup {
                transparent = false,
                italics = true,
              }
            ]],
          },
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
  { 'danfry1/lume', lazy = false, priority = 1000 },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf', build = './install --all' },
  },
}
