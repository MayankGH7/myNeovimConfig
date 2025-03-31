return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local fzf = require('fzf-lua')


    telescope.setup{
      defaults = {
        file_ignore_patterns = { "%.git/" },
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
        pickers = {
          find_files = {
            hidden = true
          }
        },
      }

      require('telescope').load_extension('fzf')

      -- Key mappings
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Telescope fuzzy find in current buffer' })

      -- Key mappings for fzf-lua (you can adjust these according to your preference)
      vim.keymap.set('n', '<leader>fl', fzf.files, { desc = 'fzf-lua find files' })
      vim.keymap.set('n', '<leader>fg', fzf.grep, { desc = 'fzf-lua live grep' })
      vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'fzf-lua buffers' })
      vim.keymap.set('n', '<leader>fk', fzf.builtin, { desc = 'fzf-lua builtin commands' })
    end
  }

