return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup {
      options = {
        separator_style = "thin",
        numbers = function(opts)
          return string.format('%s', opts.ordinal)
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        close_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator_icon = '▎',
        buffer_close_icon = 'x',
        modified_icon = '●',
        close_icon = 'x',
        left_trunc_marker = '',
        right_trunc_marker = '',
        name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
          return buf.name
        end,
      }
    }
  end,
}
