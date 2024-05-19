return {
  "neoclide/coc.nvim",
  branch = "release",
  event = "VeryLazy",

  config = function()

    local keyset = vim.keymap.set
    -- Some servers have issues with backup files, see #649
    vim.opt.backup = false
    vim.opt.writebackup = false

    -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    -- delays and poor user experience
    vim.opt.updatetime = 300

    -- Always show the signcolumn, otherwise it would shift the text each time
    -- diagnostics appeared/became resolved
    vim.opt.signcolumn = "yes"

    -- Autocomplete
    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

    keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

    -- Use <c-space> to trigger completion
    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice
    keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)


    -- GoTo code navigation
    keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
    keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
    keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
    keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

    -- Use K to show documentation in preview window
    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
      else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end

    -- Formatting selected code
    keyset("x", "<leader>fmt", "<Plug>(coc-format-selected)", {silent = true})
    keyset("n", "<leader>fmt", "<Plug>(coc-format-selected)", {silent = true})

   end
}
