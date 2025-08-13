return {
   "akinsho/bufferline.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   version = "*",
   opts = {
     options = {
        mode = "buffers",
        numbers = "ordinal",
        diagnostics = "coc",
        show_close_icon = true,
        show_buffer_icons = true,
        separator_style = "slant",
        indicator = {
            style = "full",
        }
     },
   },
}
