local tokyonight_schema = {
  "folke/tokyonight.nvim",
  priority = 1000,
  config  = function()
    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#547998"

    require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = bg_dark
        colors.bg_float = bg_dark
        colors.bg_hightlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = bg_dark
        colors.bg_statusline = bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end
    })
    vim.cmd("colorscheme tokyonight")
  end
}

local dracula_schema = {
  'Mofiqul/dracula.nvim',
  priority = 1000,

  config = function()

    require("dracula").setup({
      style = "night",
      on_colors = function(colors)
          colors.bg = "#282A36"
          colors.fg = "#F8F8F2"
          colors.selection = "#44475A"
          colors.comment = "#6272A4"
          colors.red = "#FF5555"
          colors.orange = "#FFB86C"
          colors.yellow = "#F1FA8C"
          colors.green = "#50fa7b"
          colors.purple = "#BD93F9"
          colors.cyan = "#8BE9FD"
          colors.pink = "#FF79C6"
          colors.bright_red = "#FF6E6E"
          colors.bright_green = "#69FF94"
          colors.bright_yellow = "#FFFFA5"
          colors.bright_blue = "#D6ACFF"
          colors.bright_magenta = "#FF92DF"
          colors.bright_cyan = "#A4FFFF"
          colors.bright_white = "#FFFFFF"
          colors.menu = "#21222C"
          colors.visual = "#3E4452"
          colors.gutter_fg = "#4B5263"
          colors.nontext = "#3B4048"
          colors.white = "#ABB2BF"
          colors.black = "#191A21"
      end,
      show_end_of_buffer = true,
      transparent_bg = true,
      lualine_bg_color = "#44475a",
      italic_comment = true,
      overrides = {},
      vim.cmd("colorscheme dracula")
    })

  end
}

-- return tokyonight_schema
return  dracula_schema
